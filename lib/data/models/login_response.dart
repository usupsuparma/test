// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:jangjo_customer/data/models/user_model.dart';

LoginResponse loginResponseFromJson(String str, String? token) =>
    LoginResponse.fromJson(json.decode(str), token);

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.result,
  });

  final UserModel result;

  factory LoginResponse.fromJson(Map<String, dynamic> json, String? token) =>
      LoginResponse(
        result: UserModel.fromJson(json["result"], token),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}
