from sqlalchemy import Column, Integer, String, Float, DateTime
from datetime import datetime, timezone
from ..database import Base


class Payment(Base):
    __tablename__ = "payments"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, nullable=False)
    course_id = Column(Integer, nullable=False)
    amount = Column(Float, nullable=False)
    status = Column(String, default="pending")
    payment_method = Column(String, default="online")
    transaction_id = Column(String, nullable=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
