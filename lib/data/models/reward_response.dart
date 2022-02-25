import 'dart:convert';

import 'package:jangjo_customer/data/models/reward_model.dart';

RewardResponse rewardResponseFromJson(String str) =>
    RewardResponse.fromJson(json.decode(str));

String rewardResponseToJson(RewardResponse data) => json.encode(data.toJson());

class RewardResponse {
  RewardResponse({
    required this.result,
  });

  final Result result;

  factory RewardResponse.fromJson(Map<String, dynamic> json) => RewardResponse(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  Result({
    required this.status,
    required this.rewardList,
  });

  final String status;
  final List<RewardModel> rewardList;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
        rewardList: List<RewardModel>.from(
            json["rewardList"].map((x) => RewardModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "rewardList": List<dynamic>.from(rewardList.map((x) => x.toJson())),
      };
}
