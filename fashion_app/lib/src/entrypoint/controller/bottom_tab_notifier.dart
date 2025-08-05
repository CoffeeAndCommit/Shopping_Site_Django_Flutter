import 'dart:core';


import 'package:flutter/material.dart';

class TabIndexNotifier with ChangeNotifier {
  int _index = 0;


  int get  index => _index;


  void setindex(int value) {
    _index = value;
    notifyListeners();
  }
}
