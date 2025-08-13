import 'package:fashion_app/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier extends ChangeNotifier {
  QueryType queryType = QueryType.all;
  final String _index = 'All';
  void Function()? refetch;

  void setRefetch(Function() r) {
    refetch = r;
  }

  String get index => _index;

  void setIndex(String value) {
    switch (value) {
      case 'All':
        setQueryType(QueryType.all);
        refetch!();
        break;
      case 'Popular':
        setQueryType(QueryType.popular);
         refetch!();
        break;
      case 'Unisex':
        setQueryType(QueryType.unisex);
         refetch!();
        break;
      case 'Men':
        setQueryType(QueryType.men);
         refetch!();
        break;
      case 'Women':
        setQueryType(QueryType.women);
         refetch!();
        break;
      case 'Kids':
        setQueryType(QueryType.kids);
         refetch!();
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
