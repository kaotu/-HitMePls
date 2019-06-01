from django.contrib import admin


# Register your models here.
from .models import Hitter

@admin.register(Hitter)
class HitterAdmin(admin.ModelAdmin):
    list_display = (
    'email',
    )
