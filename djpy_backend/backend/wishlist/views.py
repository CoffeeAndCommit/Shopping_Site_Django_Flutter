from typing import no_type_check
from django.shortcuts import render

# Create your views here.
from rest_framework import generics,  status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny
from . import models, serializers
# from djpy_backend.backend import wishlist

class GetWishList(generics.ListAPIView):
    serializer_class = serializers.WishListSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        # userId = self.request.query_params.get('userId', None)
        # if userId is not None:
        #     return models.WishList.objects.filter(userId=userId)
        if self.request.user.is_authenticated:
            return models.WishList.objects.filter(user=self.request.user)
        return models.WishList.objects.none() 



class ToggleWishList(APIView):
    permission_classes = [AllowAny]

    def get(self,request):
        user_id = request.user.id
        product_id = request.query_params.get('id', None)

        if not user_id or not product_id:
            return Response({'message': 'User ID and product ID are required.'}, status= status.HTTP_400_BAD_REQUEST)

        try:
            product  = models.Product.objects.get(id=product_id)
        except Exception as e:
              return Response({'message': 'product not found'}, status= status.HTTP_404_BAD_REQUEST)

        wishlist_item, created = models.WishList.objects.get_or_create(userId=request.user, product=product)

        if created :
            return Response({'message':'Product Added To Wishlist '}, status=status.HTTP_201_CREATED)
        else:
            wishlist_item.delete()
            return Response({'message':'Product Added To Wishlist '}, status=status.HTTP_204_NO_CONTENT)



