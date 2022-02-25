class SubscriptionModel {
  SubscriptionModel({
    required this.id,
    required this.active,
    required this.amount,
    required this.message,
    required this.subscriptionCode,
    required this.subscriptionName,
  });

  final int id;
  final String active;
  final int amount;
  final String message;
  final String subscriptionCode;
  final String subscriptionName;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json["id"],
        active: json["active"],
        amount: json["amount"],
        message: json["message"],
        subscriptionCode: json["subscriptionCode"],
        subscriptionName: json["subscriptionName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "amount": amount,
        "message": message,
        "subscriptionCode": subscriptionCode,
        "subscriptionName": subscriptionName,
      };
}
