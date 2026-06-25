from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from ..database import get_db
from ..models.user import User
from ..schemas.user import UserResponse
from ..utils.auth import get_current_user, require_admin

router = APIRouter(prefix="/users", tags=["Users"])


@router.get("/me", response_model=UserResponse)
def get_current_user_profile(current_user: User = Depends(get_current_user)):
    return UserResponse.model_validate(current_user)


@router.get("", response_model=list[UserResponse])
def list_users(
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    users = db.query(User).all()
    return [UserResponse.model_validate(u) for u in users]


@router.delete("/{user_id}")
def delete_user(
    user_id: int,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="User not found",
        )
    db.delete(user)
    db.commit()
    return {"message": "User deleted"}
