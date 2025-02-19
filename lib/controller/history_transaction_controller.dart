import 'dart:convert';
import 'dart:developer';

import 'package:bpro/config/config.dart';
import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/model/history_transaction_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoryTransactionController extends GetxController {
  AuthController authController = Get.find();
  var transactions = <Transaction>[].obs;
  var loading = false.obs;

  @override
  void onInit() {
    log("HI");
    fetchHistoryTransaction();
    super.onInit();
  }

  Future fetchHistoryTransaction() async {
    try {
      loading(true);
      var url = Uri.parse("${Config.baseUrl}historyapi");
      var body = json.encode({"user_id": authController.userkey});
      var response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer ${authController.sessionkey}",
          "Content-Type": "application/json",
        },
        body: body,
      );
      log("HI");

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data["data"] != null) {
          transactions.clear();
          for (var item in data["data"]) {
            transactions.add(Transaction.fromJson(item));
          }
        }
      } else {
        log("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      loading(false);
    }
  }
}
