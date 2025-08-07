import 'package:flutter/material.dart';

class ColorsSizesController extends ChangeNotifier {
  String _sizes = '';

  String get sizes => _sizes;

  void setSizes(String value) {
     if(_sizes== value){
      _sizes = '';
     }else{
      _sizes = value;
     }

 
    notifyListeners();
  }



  String _color = '';

  String get color => _color;

  void setColor(String value) {
    if (_color == value) {
      _color = '';
    } else {
      _color = value;
    }

    notifyListeners();
  }
}
