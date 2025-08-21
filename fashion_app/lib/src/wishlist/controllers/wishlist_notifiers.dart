import 'dart:convert';

import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
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
      print('here${response.statusCode}');
      if (response.statusCode == 200) {
        //  set the id to local storage
        print('herefrf');

        setToList(id);
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

  List _wishlist = [];

  List get wishlist => _wishlist;

  void setWishlist(List w) {
    _wishlist.clear();
    _wishlist = w;
    notifyListeners();
  }

  void setToList(int v) {
    String? accessToken = Storage().getString('accessToken');
    String? wishlistString = Storage().getString('${accessToken}wishlist');

    print('🔍 setToList called with value: $v');
    print('📦 AccessToken: $accessToken');
    print('📦 Existing wishlist string: $wishlistString');

    if (wishlistString == null) {
      // Wishlist not stored yet → create a new one
      List<int> wishlist = [v];
      setWishlist(wishlist);

      print('🆕 Wishlist created: $wishlist');

      Storage().setString('${accessToken}wishlist', jsonEncode(wishlist));
    } else {
      // Decode existing wishlist
      List<dynamic> decoded = jsonDecode(wishlistString);
      List<int> wishlist = decoded.map((e) => e as int).toList();

      print('📋 Current wishlist: $wishlist');

      if (wishlist.contains(v)) {
        wishlist.removeWhere((e) => e == v);

        print('❌ Removed $v → Updated wishlist: $wishlist');

        setWishlist(wishlist);
        Storage().setString('${accessToken}wishlist', jsonEncode(wishlist));
      } else {
        wishlist.add(v);

        if (kDebugMode) {
          print('✅ Added $v → Updated wishlist: $wishlist');
        }

        setWishlist(wishlist);
        Storage().setString('${accessToken}wishlist', jsonEncode(wishlist));
      }
    }

    print('💾 Wishlist successfully saved.');
  }
}
