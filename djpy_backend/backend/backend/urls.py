
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    # path('', admin.site.urls),
    path('auth/', include('djoser.urls')),
    path('auth/', include('djoser.urls.authtoken')),
    # re_path(r'^auth/', include('djoser.urls')),
    path('api/products/', include('core.urls')),
    path('api/wishlist/', include('wishlist.urls')),
    path('api/cart/', include('cart.urls')),
]
