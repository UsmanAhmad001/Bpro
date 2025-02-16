class PaymentMethod {
  final String name;

  PaymentMethod({required this.name});

 
  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      name: json['name'],
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
