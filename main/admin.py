from django.contrib import admin
from .models import Post, Contact

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'created_date', 'is_published')
    list_filter = ('is_published', 'created_date', 'author')
    search_fields = ('title', 'content')
    date_hierarchy = 'created_date'
    ordering = ('-created_date',)
    
    fieldsets = (
        ('ข้อมูลบทความ', {
            'fields': ('title', 'content', 'author')
        }),
        ('การเผยแพร่', {
            'fields': ('is_published',),
            'classes': ('collapse',)
        }),
    )

@admin.register(Contact)
class ContactAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'subject', 'created_date', 'is_read')
    list_filter = ('is_read', 'created_date')
    search_fields = ('name', 'email', 'subject', 'message')
    readonly_fields = ('created_date',)
    ordering = ('-created_date',)
    
    actions = ['mark_as_read', 'mark_as_unread']
    
    def mark_as_read(self, request, queryset):
        queryset.update(is_read=True)
    mark_as_read.short_description = "ทำเครื่องหมายว่าอ่านแล้ว"
    
    def mark_as_unread(self, request, queryset):
        queryset.update(is_read=False)
    mark_as_unread.short_description = "ทำเครื่องหมายว่ายังไม่อ่าน"
