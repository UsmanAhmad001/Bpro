import 'dart:developer';

import 'package:bpro/config/config.dart';
import 'package:bpro/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoryTransactionService {
  AuthController authController = Get.find();
  Future<http.Response> historyTranscation() async {
    log("Usman");
  var response = await http.post(Uri.parse("${Config.baseUrl}historyapi"),
   headers: {
    "Authorization": "Bearer ${authController.sessionkey}",
    "Content-Type": "application/json",
    });
  
  return response; 
}

}
