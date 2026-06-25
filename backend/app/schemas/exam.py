from pydantic import BaseModel
from typing import Optional


class ExamCreate(BaseModel):
    name: str
    eligibility: str
    exam_pattern: str
    syllabus: str = ""
    preparation_strategy: str = ""
    course_available: bool = True
    description: Optional[str] = None


class ExamResponse(BaseModel):
    id: int
    name: str
    eligibility: str
    exam_pattern: str
    syllabus: str
    preparation_strategy: str
    course_available: bool
    description: Optional[str]

    model_config = {"from_attributes": True}


class ExamListResponse(BaseModel):
    exams: list[ExamResponse]
