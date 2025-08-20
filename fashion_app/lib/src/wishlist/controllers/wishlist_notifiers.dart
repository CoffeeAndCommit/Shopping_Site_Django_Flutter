import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WishlistNotifiers with ChangeNotifier {
  String? error;
  void setError(String? error) {
    this.error = error;
    notifyListeners();
  }

  void addRemoveWishlist(int id, Function refetch) async {
    final String? accessToken = Storage().getString('accessToken');

    try {
      Uri url = Uri.parse('${Environment.appBaseUrl}/api/wishlist/toggle/$id/');

      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token $accessToken',
      });

      if (kDebugMode) {
        print("response$response");
      }
      if (response.statusCode == 200) {
        //  set the id to local storage

        // Refetch data
        refetch();
      } else if (response.statusCode == 401) {
        //   remove from local storage
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
