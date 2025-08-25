import 'dart:convert';

CartCountModel cartCountModelFromJson(String str) =>
    CartCountModel.fromJson(json.decode(str));

String cartCountModelToJson(CartCountModel data) => json.encode(data.toJson());

class CartCountModel {
  int product;
  int quantity;
  String size;
  String color;

  CartCountModel({
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });

  factory CartCountModel.fromJson(Map<String, dynamic> json) => CartCountModel(
        product: json["product"],
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "size": size,
        "color": color,
      };
}
