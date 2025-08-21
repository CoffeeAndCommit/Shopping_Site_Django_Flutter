# from django.shortcuts import render

from django.db import models
from .models import Cart, Product
from .serializers  import CartSerializer
from rest_framework import IsAutheticated 
from django.shortcuts import get_object_or_404
from rest_framework import status , generic 
from rest_framework.response import Response
from rest_framework.views import APIView

from djpy_backend.backend.cart import serializers



# Create your views here.


class AddItemToCart(APIView):
    permission_classes = [IsAutheticated]

    def post(self, request):
        user = request.user
        data = request.data
       
        try :
            product = Product.objects.get(id=data['product'])
        except:
            return Response({
                "Message": "Product not found"

            }, status=status.HTTP_404_NOT_FOUND,)  

        try :
            cart_item = Cart.objects.get(
            user=user, 
            product=product,
            color = data['color'], 
            size = data['size'],
            )
            

            cart_item.quantity += data.get('quantity', 1)
            cart_item.save()

            return Response({'message':'Item added to cart'}, status=status.HTTP_200_OK,)

        except Cart.DoesNotExist:
           
            newCart = Cart.objects.create(
            userId = user,
            product = product,
            quantity = data.get('quantity', 1),
            color = data['color'], )

            return Response({'message':'Item added to cart'}, status=status.HTTP_200_OK,)



class RemoveItemFromCart(APIView):
    permission_classes = [IsAutheticated]

    def delete(self, request,):
        user = request.user
        cart_id = request.query_params.get('id')

        if not cart_id:
            return Response({'message':'Cart Id is required'}, status=status.HTTP_400_BAD_REQUEST,)
        
        cart_item = Cart.objects.filter(userId=user,)
         
        if not cart_item.filter(id=cart_id).exists():
            return Response({'message':'Cart item not found'}, status=status.HTTP_404_NOT_FOUND,)
        
        cart_item.filter(id=cart_id).delete()
        return Response({'message':'Item removed from cart'}, status=status.HTTP_200_OK,)


class CartCount (APIView):
    permission_classes = [IsAutheticated]

    def get(self, request):
        user = request.user
        cart_count = Carts.objects.filter(userId = user ).count()
        return Response({'cart_count': cart_count}, status=status.HTTP_200_OK, )

class UpdateCartItemQuantity(APIView):
     permission_classes = [IsAutheticated]

     def patc(self, request):
        user = request.user
        item_id = request.query_params.get('id')
        

        cart_item = get_object_or_404(Cart, id=item_id, )
        cart_item.quantity = count 
        cart_item.save()

        return Response({'cart_count': 'Item Count Updated Successfully'}, status=status.HTTP_200_OK, )



class GetUserCart :
    permission_classes = [IsAutheticated]
    serializersclass = CartSerializer

    def get(self, request):
        user = request.user
        cart_items = Cart.objects.filter(userId=user)
          # .order_by('-created_at')
        serializer = CartSerializer(cart_items, many=True)
      
        return Response(serializer.data, status=status.HTTP_200_OK)
        
        