from sqlalchemy import Column, Integer, String, Float, Boolean, DateTime, Text
from datetime import datetime, timezone
from ..database import Base


class Course(Base):
    __tablename__ = "courses"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    description = Column(Text, nullable=False)
    duration = Column(String, nullable=False)
    fee = Column(Float, nullable=False)
    level = Column(String, default="Beginner")
    image_url = Column(String, nullable=True)
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
