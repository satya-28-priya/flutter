from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .database import engine, Base
from .routers import auth, courses, exams, users, notifications, materials, payments

# Create all tables
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="Merit Zone API",
    description="Backend API for Merit Zone EdTech LMS Platform",
    version="1.0.0",
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(auth.router, prefix="/api")
app.include_router(courses.router, prefix="/api")
app.include_router(exams.router, prefix="/api")
app.include_router(users.router, prefix="/api")
app.include_router(notifications.router, prefix="/api")
app.include_router(materials.router, prefix="/api")
app.include_router(payments.router, prefix="/api")


@app.get("/")
def root():
    return {"message": "Merit Zone API", "version": "1.0.0"}


@app.get("/api/health")
def health_check():
    return {"status": "healthy"}
