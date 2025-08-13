import 'package:flutter/material.dart';

class CategoryNotifier extends ChangeNotifier {
  String category = "";
  int id = 0;
   String getCategory() {
    return category;
  }

  void setCategory(String value, int id) {
    category = value;
    this.id = id;
    notifyListeners();
  }



  int getId() {
    return id;
  }


}
