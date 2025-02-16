class Transaction {
  final String id;
  final int bankType;
  final String type;
  final int amount;
  final String? status;
  final String? description;

  Transaction({
    required this.id,
    required this.bankType,
    required this.type,
    required this.amount,
    this.status,
    this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      bankType: json["bank_type"],
      type: json["type"],
      amount: json["amount"],
      status: json["status"],
      description: json["description"],
    );
  }
}
