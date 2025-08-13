import 'dart:ui';

import 'package:fashion_app/src/categories/model/categories_model.dart';
import 'package:fashion_app/src/products/models/product_model.dart';

class FetchProducts {
  final List<Products> products;

  final bool isLoading;

  final String? error;

  final VoidCallback refetch;

  FetchProducts({
    required this.products,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
