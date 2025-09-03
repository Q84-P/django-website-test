# 🌐 เว็บไซต์ Django แบบง่ายๆ

เว็บไซต์ที่สร้างด้วย Django Framework และ Bootstrap สำหรับการเรียนรู้และพัฒนา พร้อม environment ที่พร้อมสำหรับการ deploy และรันในเครื่องอื่น

## ✨ คุณสมบัติ

- 🏠 **หน้าแรก** - แสดงข้อมูลทั่วไปและคุณสมบัติของเว็บไซต์
- ℹ️ **เกี่ยวกับเรา** - ข้อมูลเกี่ยวกับทีมและพันธกิจ
- 📞 **ติดต่อเรา** - ฟอร์มติดต่อและข้อมูลการติดต่อ
- 📱 **Responsive Design** - รองรับการใช้งานบนมือถือและแท็บเล็ต
- 🎨 **Modern UI** - ออกแบบด้วย Bootstrap 5
- 🔧 **Production Ready** - พร้อมสำหรับการ deploy
- 🐳 **Docker Support** - รองรับการ containerization
- 🚀 **CI/CD Ready** - พร้อมสำหรับ GitHub Actions

## 🛠️ เทคโนโลยีที่ใช้

- **Backend**: Python Django 4.2+
- **Frontend**: HTML, CSS, JavaScript, Bootstrap 5
- **Database**: SQLite (Development) / PostgreSQL (Production)
- **Language**: ภาษาไทย
- **Server**: Gunicorn + Nginx
- **Container**: Docker & Docker Compose
- **CI/CD**: GitHub Actions

## 🚀 การติดตั้งและใช้งาน

### วิธีที่ 1: Setup อัตโนมัติ (แนะนำ)

#### Windows
```bash
# ดับเบิลคลิกไฟล์ setup.bat หรือรันคำสั่ง
setup.bat
```

#### Linux/macOS
```bash
# ให้สิทธิ์การรันไฟล์
chmod +x setup.sh

# รัน setup script
./setup.sh
```

### วิธีที่ 2: Setup แบบ Manual

#### 1. Clone โปรเจกต์
```bash
git clone <your-repository-url>
cd mywebsite
```

#### 2. สร้าง Virtual Environment
```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Linux/macOS
source venv/bin/activate
```

#### 3. ติดตั้ง Dependencies
```bash
pip install -r requirements.txt
```

#### 4. ตั้งค่า Environment Variables
```bash
# Windows
copy env.example .env

# Linux/macOS
cp env.example .env
```

#### 5. แก้ไขไฟล์ .env
```bash
# เปิดไฟล์ .env และแก้ไขค่าต่างๆ
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1
```

#### 6. รัน Migrations
```bash
python manage.py migrate
```

#### 7. สร้าง Superuser (ไม่บังคับ)
```bash
python manage.py createsuperuser
```

#### 8. Collect Static Files
```bash
python manage.py collectstatic --noinput
```

#### 9. รัน Server
```bash
python manage.py runserver
```

#### 10. เข้าใช้งาน
เปิดเบราว์เซอร์และไปที่: `http://127.0.0.1:8000/`

## 🐳 การใช้งาน Docker

### Development Environment
```bash
# รันด้วย Docker Compose
docker-compose up --build

# หรือรันแยก services
docker-compose up web
```

### Production Build
```bash
# Build Docker image
docker build -t mywebsite .

# รัน container
docker run -p 8000:8000 mywebsite
```

## 📁 โครงสร้างโปรเจกต์

```
mywebsite/
├── manage.py
├── requirements.txt
├── .gitignore
├── env.example
├── setup.sh / setup.bat
├── Dockerfile
├── docker-compose.yml
├── gunicorn.conf.py
├── Procfile
├── nginx.conf
├── django.service
├── deploy.sh
├── .github/workflows/django.yml
├── mywebsite/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── main/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── templates/
│   └── main/
│       ├── base.html
│       ├── home.html
│       ├── about.html
│       └── contact.html
├── static/
├── media/
└── staticfiles/
```

## 🎯 หน้าเว็บไซต์

### หน้าแรก (`/`)
- Hero section พร้อมปุ่ม call-to-action
- แสดงคุณสมบัติเด่นของเว็บไซต์
- ข้อมูลสรุปเกี่ยวกับเรา

### เกี่ยวกับเรา (`/about/`)
- พันธกิจและวิสัยทัศน์
- ค่านิยมหลักขององค์กร
- เทคโนโลยีที่ใช้
- ข้อมูลทีมพัฒนา

### ติดต่อเรา (`/contact/`)
- ฟอร์มส่งข้อความ
- ข้อมูลการติดต่อ
- เวลาทำการ
- สื่อสังคม

## 🔧 การปรับแต่ง

### เปลี่ยนสีธีม
แก้ไขไฟล์ `templates/main/base.html` ในส่วน CSS variables

### เพิ่มหน้าใหม่
1. สร้าง view ใน `main/views.py`
2. เพิ่ม URL pattern ใน `main/urls.py`
3. สร้าง template ใน `templates/main/`

### เพิ่มฟีเจอร์
- ระบบสมาชิก
- ระบบบล็อก
- ระบบแกลเลอรี่
- ระบบช้อปปิ้ง

## 🚀 การ Deploy

### Heroku
```bash
# ติดตั้ง Heroku CLI
heroku create your-app-name
git push heroku main
heroku run python manage.py migrate
```

### DigitalOcean / VPS
```bash
# รัน deployment script
chmod +x deploy.sh
./deploy.sh
```

### Docker Production
```bash
# Build และรัน production image
docker build -t mywebsite:prod .
docker run -d -p 80:8000 mywebsite:prod
```

## 🔒 ความปลอดภัย

### Environment Variables
- ใช้ไฟล์ `.env` สำหรับเก็บข้อมูลที่สำคัญ
- ไม่ commit ไฟล์ `.env` ขึ้น Git
- ใช้ `env.example` เป็น template

### Production Settings
- ปิด DEBUG mode
- ใช้ SECRET_KEY ที่ปลอดภัย
- ตั้งค่า ALLOWED_HOSTS
- เปิดใช้ HTTPS

## 📝 หมายเหตุ

- เว็บไซต์นี้สร้างขึ้นเพื่อการเรียนรู้
- ใช้ SQLite เป็นฐานข้อมูล (เหมาะสำหรับการพัฒนา)
- สำหรับ Production ควรใช้ PostgreSQL หรือ MySQL
- ควรเพิ่มระบบความปลอดภัยเพิ่มเติม

## 🤝 การสนับสนุน

หากมีคำถามหรือต้องการความช่วยเหลือ สามารถติดต่อได้ที่:
- 📧 Email: info@mywebsite.com
- 📞 โทร: 02-123-4567

## 📄 License

MIT License - ใช้งานได้อย่างอิสระ

---

**สร้างด้วย ❤️ โดย Django Framework**
