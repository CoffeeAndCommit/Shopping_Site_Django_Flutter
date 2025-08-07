import 'package:fashion_app/src/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductNotifier with ChangeNotifier {
  Products? product;

  void setproduct(Products product) {
    this.product = product;
    notifyListeners();
  }

  bool _description = false;

  bool get description => _description;

  void setdescription() {
    _description = !_description;
    notifyListeners();
  }

  void resetdescription() {
    _description = false;
    notifyListeners();
  }
}
