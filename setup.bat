@echo off
echo 🚀 Setting up Django project environment...

REM Create virtual environment
echo 📦 Creating virtual environment...
python -m venv venv

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo 📥 Installing dependencies...
pip install -r requirements.txt

REM Copy environment file
echo 📋 Setting up environment variables...
copy env.example .env

REM Run migrations
echo 🗄️ Running database migrations...
python manage.py migrate

REM Create superuser (optional)
echo 👤 Creating superuser (optional)...
set /p create_superuser="Do you want to create a superuser? (y/n): "
if "%create_superuser%"=="y" (
    python manage.py createsuperuser
)

REM Collect static files
echo 📁 Collecting static files...
python manage.py collectstatic --noinput

echo ✅ Setup completed successfully!
echo 🎯 To start the development server, run:
echo    venv\Scripts\activate.bat
echo    python manage.py runserver
pause
