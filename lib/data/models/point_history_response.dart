import 'dart:convert';

import 'package:jangjo_customer/data/models/Point_history_model.dart';

PointHistoryResponse pointHistoryResponseFromJson(String str) =>
    PointHistoryResponse.fromJson(json.decode(str));

String pointHistoryResponseToJson(PointHistoryResponse data) =>
    json.encode(data.toJson());

class PointHistoryResponse {
  PointHistoryResponse({
    required this.result,
  });

  final Result result;

  factory PointHistoryResponse.fromJson(Map<String, dynamic> json) =>
      PointHistoryResponse(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.status,
    required this.pointHistory,
  });

  final String status;
  final List<PointHistoryModel> pointHistory;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        pointHistory: List<PointHistoryModel>.from(
            json["historyRewardPointList"]
                .map((x) => PointHistoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "historyRewardPointList":
            List<dynamic>.from(pointHistory.map((x) => x.toJson())),
      };
}
