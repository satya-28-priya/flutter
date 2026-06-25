from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from ..database import get_db
from ..models.course import Course
from ..schemas.course import CourseCreate, CourseResponse, CourseListResponse
from ..utils.auth import get_current_user, require_admin

router = APIRouter(prefix="/courses", tags=["Courses"])


@router.get("", response_model=CourseListResponse)
def list_courses(db: Session = Depends(get_db)):
    courses = db.query(Course).filter(Course.is_active == True).all()
    return CourseListResponse(
        courses=[CourseResponse.model_validate(c) for c in courses]
    )


@router.get("/{course_id}", response_model=CourseResponse)
def get_course(course_id: int, db: Session = Depends(get_db)):
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Course not found",
        )
    return CourseResponse.model_validate(course)


@router.post("", response_model=CourseResponse)
def create_course(
    course_data: CourseCreate,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    course = Course(**course_data.model_dump())
    db.add(course)
    db.commit()
    db.refresh(course)
    return CourseResponse.model_validate(course)


@router.put("/{course_id}", response_model=CourseResponse)
def update_course(
    course_id: int,
    course_data: CourseCreate,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Course not found",
        )
    for key, value in course_data.model_dump().items():
        setattr(course, key, value)
    db.commit()
    db.refresh(course)
    return CourseResponse.model_validate(course)


@router.delete("/{course_id}")
def delete_course(
    course_id: int,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    course = db.query(Course).filter(Course.id == course_id).first()
    if not course:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Course not found",
        )
    db.delete(course)
    db.commit()
    return {"message": "Course deleted"}
