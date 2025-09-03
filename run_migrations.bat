@echo off
echo Running Django Migrations...
echo.
python manage.py migrate
echo.
echo Migrations completed!
pause
