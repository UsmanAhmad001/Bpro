import 'dart:convert';
import 'dart:developer';
import 'package:bpro/model/widthdrawal_model.dart';
import 'package:http/http.dart' as http;

class WidthdrawalService {
  Future<List<PaymentMethod>> fetchBanks() async {
  var response = await http.get(Uri.parse("https://betprowallet.com/api/get/bank-types"));
  
  log("Request URL: $response");
  log("Response Status Code: ${response.statusCode}"); 
  log("Response Body: ${response.body}"); 

  if (response.statusCode == 200) {
    log("This is the response from the service: ${response.body}");
    var data = jsonDecode(response.body)['data'];
    return (data as List).map((item) => PaymentMethod.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load banks');
  }
}

}
