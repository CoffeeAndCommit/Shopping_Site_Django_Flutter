


import 'package:fashion_app/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier extends ChangeNotifier {
  QueryType queryType = QueryType.all;
 String _index = 'All';

 String get index => _index;



void  setIndex(String value) {
    switch (value) {
      case 'All':
        setQueryType(QueryType.all);
        break;
      case 'Popular':
        setQueryType(QueryType.popular);
        break;
      case 'Unisex':
        setQueryType(QueryType.unisex);
        break;
      case 'Men':
        setQueryType(QueryType.men);
        break;
      case 'Women':
        setQueryType(QueryType.women);
        break;
      case 'Kids':
        setQueryType(QueryType.kids);
        break;
      default:
    }
    notifyListeners();
  }


  void setQueryType(QueryType queryType) {
    queryType = queryType;
    notifyListeners();
  }


}
