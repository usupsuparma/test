import 'dart:convert';
import 'package:jangjo_customer/data/models/subscription_model.dart';

SubscriptionResponse subscriptionResponseFromJson(String str) =>
    SubscriptionResponse.fromJson(json.decode(str));

String subscriptionResponseToJson(SubscriptionResponse data) =>
    json.encode(data.toJson());

class SubscriptionResponse {
  SubscriptionResponse({
    required this.result,
  });

  final Result result;

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      SubscriptionResponse(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.status,
    required this.subscriptionList,
  });

  final String status;
  final List<SubscriptionModel> subscriptionList;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        subscriptionList: List<SubscriptionModel>.from(
            json["subscriptionList"].map((x) => SubscriptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "subscriptionList":
            List<dynamic>.from(subscriptionList.map((x) => x.toJson())),
      };
}
