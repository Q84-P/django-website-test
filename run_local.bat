@echo off
echo ========================================
echo Django Local Development Server
echo ========================================

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install requirements if needed
echo Installing requirements...
pip install -r requirements.txt

REM Run migrations
echo Running migrations...
python manage.py migrate

REM Collect static files
echo Collecting static files...
python manage.py collectstatic --noinput

REM Start development server
echo Starting development server...
echo.
echo Server will be available at: http://127.0.0.1:8000
echo Press Ctrl+C to stop the server
echo.
python manage.py runserver 127.0.0.1:8000

pause
