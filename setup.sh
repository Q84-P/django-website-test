# Setup script for new environment
#!/bin/bash

echo "🚀 Setting up Django project environment..."

# Create virtual environment
echo "📦 Creating virtual environment..."
python -m venv venv

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies..."
pip install -r requirements.txt

# Copy environment file
echo "📋 Setting up environment variables..."
cp env.example .env

# Run migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

# Create superuser (optional)
echo "👤 Creating superuser (optional)..."
read -p "Do you want to create a superuser? (y/n): " create_superuser
if [ "$create_superuser" = "y" ]; then
    python manage.py createsuperuser
fi

# Collect static files
echo "📁 Collecting static files..."
python manage.py collectstatic --noinput

echo "✅ Setup completed successfully!"
echo "🎯 To start the development server, run:"
echo "   source venv/bin/activate"
echo "   python manage.py runserver"
