# Merit Zone - EdTech LMS Platform

Your Gateway To Success - A complete EdTech Learning Management System built with Flutter Web and FastAPI.

## Tech Stack

- **Frontend:** Flutter Web with Provider state management
- **Backend:** FastAPI with SQLAlchemy ORM
- **Database:** SQLite
- **Authentication:** JWT (PyJWT)

## Getting Started

### Frontend
```bash
flutter pub get
flutter run -d chrome
```

### Backend
```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

## Features

- Responsive design (mobile/tablet/desktop)
- JWT authentication with role-based access (Student/Faculty/Admin)
- Dynamic course management
- Competitive exam preparation sections
- Admin dashboard for content management
- 69 unit tests covering models, services, utilities, and widgets
