import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  String category = "";

   String getCategory() {
    return category;
  }

  void setCategory(String value) {
    category = value;
    notifyListeners();
  }

  int id = 0;

  int getId() {
    return id;
  }

 

  void setId(int value) {
    id = value;
    notifyListeners();
  }
}
