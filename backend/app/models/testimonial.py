from sqlalchemy import Column, Integer, String, DateTime, Text
from datetime import datetime, timezone
from ..database import Base


class Testimonial(Base):
    __tablename__ = "testimonials"

    id = Column(Integer, primary_key=True, index=True)
    student_name = Column(String, nullable=False)
    message = Column(Text, nullable=False)
    exam_name = Column(String, default="")
    rank = Column(String, default="")
    rating = Column(Integer, default=5)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
