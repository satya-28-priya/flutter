from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from typing import Optional

from ..database import get_db
from ..models.notification import Notification
from ..utils.auth import require_admin

router = APIRouter(prefix="/notifications", tags=["Notifications"])


class NotificationCreate(BaseModel):
    title: str
    message: str
    notification_type: str = "general"


class NotificationResponse(BaseModel):
    id: int
    title: str
    message: str
    notification_type: str
    is_active: bool

    model_config = {"from_attributes": True}


@router.get("", response_model=list[NotificationResponse])
def list_notifications(db: Session = Depends(get_db)):
    notifications = db.query(Notification).filter(Notification.is_active == True).all()
    return [NotificationResponse.model_validate(n) for n in notifications]


@router.post("", response_model=NotificationResponse)
def create_notification(
    data: NotificationCreate,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    notification = Notification(**data.model_dump())
    db.add(notification)
    db.commit()
    db.refresh(notification)
    return NotificationResponse.model_validate(notification)


@router.delete("/{notification_id}")
def delete_notification(
    notification_id: int,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    notification = db.query(Notification).filter(Notification.id == notification_id).first()
    if not notification:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Notification not found",
        )
    db.delete(notification)
    db.commit()
    return {"message": "Notification deleted"}
