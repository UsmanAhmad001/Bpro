import 'dart:convert';

class DepositeModel {
  List<Deposite> data;

  DepositeModel({required this.data});

  factory DepositeModel.fromJson(Map<String, dynamic> json) {
    return DepositeModel(
      data: List<Deposite>.from(json["data"].map((x) => Deposite.fromJson(x))),
    );
  }
}

class Deposite {
  String id;
  String name;
  String acTitle;
  String acNumber;
  String bankId;

  Deposite({
    required this.id,
    required this.name,
    required this.acTitle,
    required this.acNumber,
    required this.bankId,
  });

  factory Deposite.fromJson(Map<String, dynamic> json) => Deposite(
    id: json["bank_id"],
    name: json["name"],
    acTitle: json["ac_title"],
    acNumber: json["ac_number"],
    bankId: json["bank_id"],
  );
}
