// To parse this JSON data, do
//
//     final authTokenModel = authTokenModelFromJson(jsonString);

import 'dart:convert';

AccessTokenModel authTokenModelFromJson(String str) =>
    AccessTokenModel.fromJson(json.decode(str));

String authTokenModelToJson(AccessTokenModel data) => json.encode(data.toJson());

class AccessTokenModel {
  String authToken;

  AccessTokenModel({
    required this.authToken,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) => AccessTokenModel(
        authToken: json["auth_token"],
      );

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
      };
}
