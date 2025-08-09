from unicodedata import category
from django.db import models

from django.utils import timezone



# Create your models here.

class Category(models.Model):
    title = models.CharField(max_length=255)
    imageUrl = models.URLField(blank=False)

    def __str__(self) -> str:
        return self.title



class Brand(models.Model):
    title = models.CharField(max_length=255)
    imageUrl = models.URLField(blank=False)

    def __str__(self) -> str:
        return self.title



class Product(models.Model):
    title = models.CharField(max_length=255)
    price = models.FloatField(default=0.0)
    description = models.TextField(max_length=555)
    is_featured = models.BooleanField(default=False)
    clothes_type = models.CharField(max_length=255, default='Unisex')
    rating = models.FloatField(blank= False, default=0.0)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    color= models.JSONField(default=dict)
    sizes= models.JSONField(default=dict)
    imageUrls = models.JSONField(blank=True)
    created_at = models.DateTimeField(default=timezone.now, blank= False, )


    def __str__(self) -> str:
        return self.title



    

   