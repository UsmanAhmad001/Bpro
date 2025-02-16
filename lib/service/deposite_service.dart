import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/deposite_model.dart';

class DepositeService {
  Future<List<Deposite>> fetchBank() async {
    try {
      var response = await http.get(Uri.parse("https://betprowallet.com/api/getbanks"));

      if (response.statusCode == 200) {
        DepositeModel depositeModel = DepositeModel.fromJson(json.decode(response.body));
        return depositeModel.data;  // Return list of Deposite objects
      } else {
        log("Error: Failed to fetch data. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      log("Error while fetching bank data: $e");
      return [];
    }
  }
}
