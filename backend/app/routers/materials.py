from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy.orm import Session
from typing import Optional

from ..database import get_db
from ..models.material import Material
from ..utils.auth import require_admin

router = APIRouter(prefix="/materials", tags=["Study Materials"])


class MaterialCreate(BaseModel):
    title: str
    description: Optional[str] = None
    file_url: Optional[str] = None
    material_type: str = "pdf"
    course_id: Optional[int] = None


class MaterialResponse(BaseModel):
    id: int
    title: str
    description: Optional[str]
    file_url: Optional[str]
    material_type: str
    course_id: Optional[int]

    model_config = {"from_attributes": True}


@router.get("", response_model=list[MaterialResponse])
def list_materials(db: Session = Depends(get_db)):
    materials = db.query(Material).all()
    return [MaterialResponse.model_validate(m) for m in materials]


@router.post("", response_model=MaterialResponse)
def create_material(
    data: MaterialCreate,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    material = Material(**data.model_dump())
    db.add(material)
    db.commit()
    db.refresh(material)
    return MaterialResponse.model_validate(material)


@router.delete("/{material_id}")
def delete_material(
    material_id: int,
    db: Session = Depends(get_db),
    _: None = Depends(require_admin),
):
    material = db.query(Material).filter(Material.id == material_id).first()
    if not material:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Material not found",
        )
    db.delete(material)
    db.commit()
    return {"message": "Material deleted"}
