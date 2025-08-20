from rest_framework import serializers
from . import models

class WishListSerializer(serializers.ModelSerializer):
    id = serializers.ReadOnlyField(source= 'product.id')
    title = serializers.ReadOnlyField(source= 'product.title')
    price = serializers.ReadOnlyField(source= 'product.price')
    description = serializers.ReadOnlyField(source= 'product.description')
    is_featured = serializers.ReadOnlyField(source= 'product.is_featured')
    clothes_type = serializers.ReadOnlyField(source= 'product.clothes_type')
    ratings = serializers.ReadOnlyField(source= 'product.ratings')
    category = serializers.ReadOnlyField(source= 'product.category.id')
    brand = serializers.ReadOnlyField(source= 'product.brand.id')
    color = serializers.ReadOnlyField(source= 'product.color')
    sizes = serializers.ReadOnlyField(source= 'product.sizes')
    imageUrls = serializers.ReadOnlyField(source= 'product.imageUrls')
    created_at = serializers.ReadOnlyField(source= 'product.created_at')


    class Meta:
        model = models.WishList
        fields = '__all__'