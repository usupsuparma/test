class Subscription {
  Subscription({
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
}
