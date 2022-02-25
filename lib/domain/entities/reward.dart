class Reward {
  Reward({
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
}
