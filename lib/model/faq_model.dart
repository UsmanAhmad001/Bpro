class DataModel {
  final String subject;
  final String type;
  final String description;

  DataModel({
    required this.subject,
    required this.type,
    required this.description,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      subject: json['subject'],
      type: json['type'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'type': type,
      'description': description,
    };
  }

  static List<DataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DataModel.fromJson(json)).toList();
  }
}
