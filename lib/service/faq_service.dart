import 'dart:convert';
import 'dart:developer';
import 'package:bpro/config/config.dart';
import 'package:bpro/model/faq_model.dart';
import 'package:http/http.dart' as http;

class FaqService {
  Future<List<DataModel>?> faq() async {
    try {
      var response = await http.get(Uri.parse("${Config.baseUrl}faq"));
      log("FAQ Response: ${response.body}");
      log("Status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);

        List<dynamic> faqListData = jsonData["data"];

        List<DataModel> faqList =
            faqListData.map((e) => DataModel.fromJson(e)).toList();

        return faqList;
      } else {
        log("Error: Failed to load data - ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Exception: $e");
      return null;
    }
  }
}
