# Deployment script for production
#!/bin/bash

echo "🚀 Deploying Django application to production..."

# Update code from Git
echo "📥 Updating code from Git..."
git pull origin main

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Install/update dependencies
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Run migrations
echo "🗄️ Running database migrations..."
python manage.py migrate

# Collect static files
echo "📁 Collecting static files..."
python manage.py collectstatic --noinput

# Restart services
echo "🔄 Restarting services..."
sudo systemctl restart django
sudo systemctl restart nginx

# Check service status
echo "✅ Checking service status..."
sudo systemctl status django
sudo systemctl status nginx

echo "🎉 Deployment completed successfully!"
