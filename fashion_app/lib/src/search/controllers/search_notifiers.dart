import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/src/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchNotifiers with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Products> _results = [];

  List<Products> get results => _results;

  void setResults(List<Products> value) {
    _results = value;
    notifyListeners();
  }

  void clearResults() {
    _results = [];
    notifyListeners();
  }

  String currentQuery = '';

  void setCurrentQuery(String query) {
    currentQuery = query;
    notifyListeners();
  }

  String _serachKey = '';

  String get searchKey => _serachKey;

  void setSearchKey(String value) {
    _serachKey = value;
    notifyListeners();
  }

  String? _error;

  String get error => error ?? '';

  void setError(String value) {
    _error = value;
    notifyListeners();
  }

  void searchFunction(String searchKey) async {
    setLoading(true);
    setSearchKey(searchKey);
    Uri url = Uri.parse(
        '${Environment.appBaseUrl}/api/products/search/?q=$searchKey');

    try {
      var res = await http.get(url);

      if (res.statusCode == 200) {
        var data = productsFromJson(res.body);
        setResults(data);

        setLoading(false);
      }
    } catch (e) {
      setError(e.toString());
      setLoading(false);
    }
  }
}
