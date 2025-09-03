from django.db import models
from django.contrib.auth.models import User

class Post(models.Model):
    title = models.CharField(max_length=200, verbose_name="หัวข้อ")
    content = models.TextField(verbose_name="เนื้อหา")
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="ผู้เขียน")
    created_date = models.DateTimeField(auto_now_add=True, verbose_name="วันที่สร้าง")
    updated_date = models.DateTimeField(auto_now=True, verbose_name="วันที่อัปเดต")
    is_published = models.BooleanField(default=False, verbose_name="เผยแพร่")
    
    class Meta:
        verbose_name = "บทความ"
        verbose_name_plural = "บทความ"
        ordering = ['-created_date']
    
    def __str__(self):
        return self.title

class Contact(models.Model):
    name = models.CharField(max_length=100, verbose_name="ชื่อ")
    email = models.EmailField(verbose_name="อีเมล")
    subject = models.CharField(max_length=200, verbose_name="หัวข้อ")
    message = models.TextField(verbose_name="ข้อความ")
    created_date = models.DateTimeField(auto_now_add=True, verbose_name="วันที่ส่ง")
    is_read = models.BooleanField(default=False, verbose_name="อ่านแล้ว")
    
    class Meta:
        verbose_name = "ข้อความติดต่อ"
        verbose_name_plural = "ข้อความติดต่อ"
        ordering = ['-created_date']
    
    def __str__(self):
        return f"{self.name} - {self.subject}"
