from django.db import models

# Create your models here.
class Hitter(models.Model):
    email = models.EmailField(max_length=300)
