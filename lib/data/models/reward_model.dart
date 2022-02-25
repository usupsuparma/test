import 'package:jangjo_customer/domain/entities/reward.dart';

class RewardModel {
  RewardModel({
    required this.id,
    required this.active,
    required this.amount,
    required this.imageLink,
    required this.rewardCode,
    required this.rewardName,
    required this.description,
  });

  final int id;
  final String active;
  final int amount;
  final String imageLink;
  final String rewardCode;
  final String rewardName;
  final String description;

  Reward toEntity() {
    return Reward(
        id: id,
        active: active,
        amount: amount,
        imageLink: imageLink,
        rewardCode: rewardCode,
        rewardName: rewardName,
        description: description);
  }

  factory RewardModel.fromJson(Map<String, dynamic> json) => RewardModel(
        id: json["id"],
        active: json["active"],
        amount: json["amount"],
        imageLink: json["imageLink"],
        rewardCode: json["rewardCode"],
        rewardName: json["rewardName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "amount": amount,
        "imageLink": imageLink,
        "rewardCode": rewardCode,
        "rewardName": rewardName,
        "description": description,
      };
}
