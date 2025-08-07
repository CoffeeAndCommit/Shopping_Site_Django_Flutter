


import 'package:fashion_app/src/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductNotifier  with ChangeNotifier {

  Products? product;

  void setproduct(Products product) {
    this.product = product;
    notifyListeners();
  }
}



