import 'package:fashion_app/common/services/storage.dart' show Storage;
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/src/categories/hook/results/category_products_results.dart';
import 'package:fashion_app/src/products/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchProducts fetchWishlist() {
  final products = useState<List<Products>>([]);

  final isLoading = useState<bool>(false);

  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri uri = Uri.parse('${Environment.appBaseUrl}/api/wishlist/me/');
      String? accessToken = Storage().getString('accessToken');

      final response = await http.get(
        uri,
      );

      print('response status code $response');

      if (response.statusCode == 200) {
        products.value = productsFromJson(response.body);
      }
    } catch (e) {
      error.value = e.toString();
      if (kDebugMode) {
        print('error ${e.toString()}');
      }
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchProducts(
    products: products.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
