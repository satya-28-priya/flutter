from sqlalchemy import Column, Integer, String, Boolean, Text, DateTime
from datetime import datetime, timezone
from ..database import Base


class Exam(Base):
    __tablename__ = "exams"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    eligibility = Column(String, nullable=False)
    exam_pattern = Column(String, nullable=False)
    syllabus = Column(Text, default="")
    preparation_strategy = Column(Text, default="")
    course_available = Column(Boolean, default=True)
    description = Column(Text, nullable=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
