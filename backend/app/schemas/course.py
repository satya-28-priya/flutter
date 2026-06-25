from pydantic import BaseModel
from typing import Optional


class CourseCreate(BaseModel):
    name: str
    description: str
    duration: str
    fee: float
    level: str = "Beginner"
    image_url: Optional[str] = None


class CourseResponse(BaseModel):
    id: int
    name: str
    description: str
    duration: str
    fee: float
    level: str
    image_url: Optional[str]
    is_active: bool

    model_config = {"from_attributes": True}


class CourseListResponse(BaseModel):
    courses: list[CourseResponse]
