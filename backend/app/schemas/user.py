from pydantic import BaseModel, EmailStr


class UserRegister(BaseModel):
    name: str
    email: str
    mobile: str
    password: str
    student_type: str = "online"


class UserLogin(BaseModel):
    identifier: str
    password: str


class UserResponse(BaseModel):
    id: int
    name: str
    email: str
    mobile: str
    role: str
    student_type: str

    model_config = {"from_attributes": True}


class TokenResponse(BaseModel):
    token: str
    user: UserResponse
