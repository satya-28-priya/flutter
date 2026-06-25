from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from typing import Optional

from ..database import get_db
from ..models.payment import Payment
from ..models.user import User
from ..utils.auth import get_current_user, require_admin

router = APIRouter(prefix="/payments", tags=["Payments"])


class PaymentCreate(BaseModel):
    course_id: int
    amount: float
    payment_method: str = "online"


class PaymentResponse(BaseModel):
    id: int
    user_id: int
    course_id: int
    amount: float
    status: str
    payment_method: str
    transaction_id: Optional[str]

    model_config = {"from_attributes": True}


@router.get("", response_model=list[PaymentResponse])
def list_payments(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    if current_user.role == "admin":
        payments = db.query(Payment).all()
    else:
        payments = db.query(Payment).filter(Payment.user_id == current_user.id).all()
    return [PaymentResponse.model_validate(p) for p in payments]


@router.post("", response_model=PaymentResponse)
def create_payment(
    data: PaymentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    payment = Payment(
        user_id=current_user.id,
        course_id=data.course_id,
        amount=data.amount,
        payment_method=data.payment_method,
        status="completed",
    )
    db.add(payment)
    db.commit()
    db.refresh(payment)
    return PaymentResponse.model_validate(payment)
