from sqlalchemy import Column, Integer, String, DateTime, Text
from datetime import datetime, timezone
from ..database import Base


class Material(Base):
    __tablename__ = "materials"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, nullable=False)
    description = Column(Text, nullable=True)
    file_url = Column(String, nullable=True)
    material_type = Column(String, default="pdf")
    course_id = Column(Integer, nullable=True)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc))
