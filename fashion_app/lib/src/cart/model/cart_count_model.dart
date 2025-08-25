// To parse this JSON data, do:
//   final cartCount = cartCountModelFromJson(jsonString);

import 'dart:convert';

CartCountModel cartCountModelFromJson(String str) =>
    CartCountModel.fromJson(json.decode(str));

String cartCountModelToJson(CartCountModel data) => json.encode(data.toJson());

class CartCountModel {
  CartCountModel({
    required this.cartCount,
  });

  final int cartCount;

  // Optional helpers in quicktype-ish style
  factory CartCountModel.fromRawJson(String str) =>
      CartCountModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartCountModel.fromJson(Map<String, dynamic> json) => CartCountModel(
        cartCount: json["cart_count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
      };

  CartCountModel copyWith({int? cartCount}) =>
      CartCountModel(cartCount: cartCount ?? this.cartCount);
}
