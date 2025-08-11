# from django.shortcuts import render

# Create your views here.

from itertools import product
from rest_framework import generics,  status
from rest_framework.response import Response
from rest_framework.views import APIView

from . import models
from . import serializers

from django.db.models import Count 
import random


class CategoryList(generics.ListAPIView):

    serializer_class = serializers.CategorySerializer
    queryset = models.Category.objects.all()

class HomeCategoryList(generics.ListAPIView):

    serializer_class = serializers.CategorySerializer

    def get_queryset(self):
        queryset =  models.Category.objects.all()
        queryset = queryset.annotate(random_order = Count('id'))
        queryset = list(queryset)
        random.shuffle(queryset)
        return queryset[:5]


class BrandList(generics.ListAPIView):

    serializer_class = serializers.BrandSerializer
    queryset = models.Brand.objects.all()

class ProductList(generics.ListAPIView):

    serializer_class = serializers.ProductSerializer
    def get_queryset(self):
        queryset =  models.Product.objects.all()
        queryset = queryset.annotate(random_order = Count('id'))
        queryset = list(queryset)
        random.shuffle(queryset)
        return queryset[:20]

class PopularProductsList(generics.ListAPIView):
    serializer_class = serializers.ProductSerializer
    def get_queryset(self):
        queryset =  models.Product.objects.filter(rating__gt=4, rating__lt=5)()
        queryset = queryset.annotate(random_order = Count('id'))
        queryset = list(queryset)
        random.shuffle(queryset)
        return queryset[:20]

class ProductListByClothesType(generics.ListAPIView):

    serializer_class = serializers.ProductSerializer
    def get_queryset(self):

        query = request.query_params.get('clothes_type', None)

        if query :
             queryset =  models.Product.objects.filter(clothes_type=query)()
             queryset = queryset.annotate(random_order = Count('id'))


             product_list = list(queryset)
             random.shuffle(product_list)
             limited_products = product_list[:20]

             serializer = serializers.ProductSerializer(limited_products, many=True)
             return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'No products found'}, status=status.HTTP_404_NOT_FOUND)
            
class SimilarProduct(APIView):
    def get(self, request):
        query = request.query_params.get('category', None)

        if query :
             products =  models.Product.objects.filter(category=query)()
             
             product_list = list(products)
             random.shuffle(product_list)
             limited_products = product_list[:20]
             serializer = serializers.ProductSerializer(limited_products, many=True)
             return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'No products found'}, status=status.HTTP_404_NOT_FOUND)

class SearchProductByTitle(APIView):
    def get(self, request):
        query = request.query_params.get('q', None)

        if(query):
            products =  models.Product.objects.filter(title__icontains=query)()

            serializer = serializers.ProductSerializer(products, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response({'message': 'No products found'}, status=status.HTTP_404_NOT_FOUND)


           

        
    
