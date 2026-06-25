from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from ..database import get_db
from ..models.exam import Exam
from ..schemas.exam import ExamCreate, ExamResponse, ExamListResponse
from ..utils.auth import require_admin

router = APIRouter(prefix="/exams", tags=["Exams"])


@router.get("", response_model=ExamListResponse)
def list_exams(db: Session = Depends(get_db)):
    exams = db.query(Exam).all()
    return ExamListResponse(
        exams=[ExamResponse.model_validate(e) for e in exams]
    )


@router.get("/{exam_id}", response_model=ExamResponse)
def get_exam(exam_id: int, db: Session = Depends(get_db)):
    exam = db.query(Exam).filter(Exam.id == exam_id).first()
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Exam not found",
        )
    return ExamResponse.model_validate(exam)


@router.post("", response_model=ExamResponse)
def create_exam(
    exam_data: ExamCreate,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    exam = Exam(**exam_data.model_dump())
    db.add(exam)
    db.commit()
    db.refresh(exam)
    return ExamResponse.model_validate(exam)


@router.delete("/{exam_id}")
def delete_exam(
    exam_id: int,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    exam = db.query(Exam).filter(Exam.id == exam_id).first()
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Exam not found",
        )
    db.delete(exam)
    db.commit()
    return {"message": "Exam deleted"}
