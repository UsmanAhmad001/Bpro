import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bpro/config/config.dart';
import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/screens/bprodashboard/bpro_dashboard_screen.dart';
import 'package:bpro/service/widthdrawal_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WithdrawalController extends GetxController {
  AuthController authcontroller = Get.find();
  var selected = "".obs;
  var payments = <String>[].obs;
  var loading = false.obs;
  var amount = TextEditingController();
  var withdrawTimeFrom = ''.obs;
  var withdrawTimeTo = ''.obs;
  var whatsappNumber = ''.obs;
    var showButton = false.obs;

  var description = TextEditingController();

  void updatedText(String value) {
    selected.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    widrawalTime();
    checkTime();
    fetchBanks();
  }

  Future fetchBanks() async {
    try {
      loading(true);
      WidthdrawalService widthdrawalService = WidthdrawalService();
      var data = await widthdrawalService.fetchBanks();
      payments.addAll(data.map((e) => e.name).toList());
      log("Payment Methods: $payments");
    } catch (e) {
      log("Error fetching payment data: $e");
    } finally {
      loading(false);
    }
  }

  Future widthdrawal(BuildContext context) async {
    try {
      loading(true);
      var url = Uri.parse("${Config.baseUrl}withdrawal");
      log(
        selected.value,
      );
      DateTime now = DateTime.now();
      String time = "${now.hour}:${now.minute}:${now.second}";
      var body = json.encode({
        "user_id": authcontroller.userkey,
        "bank_type": selected.value,
        "description": description.text.trim(),
        "amount": amount.text.trim(),
        "time": time
      });
      var response = await http.post(url, body: body, headers: {
        "Authorization": "Bearer ${authcontroller.sessionkey}",
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        log("API Response: ${data['Message']}");
        if (data['Message'] == 'Withdrawal Created Successfully') {
          amount.clear();

          description.clear();

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            headerAnimationLoop: true,
            animType: AnimType.scale,
            title: 'Success',
            desc: 'Withdrawal Created Successfully!',
            btnOkOnPress: () {
              Get.to(BproDashboardScreen());
            },
          ).show();
        } else {
          log("ERROR");
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          headerAnimationLoop: true,
          animType: AnimType.scale,
          title: 'Error',
          desc: 'Failed widthdrawal.',
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      log("$e");
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: true,
        animType: AnimType.scale,
        title: 'Exception',
        desc: 'An error occurred: $e',
        btnOkOnPress: () {},
      ).show();
    } finally {
      loading(false);
    }
  }

  Future widrawalTime() async {
    try {
      var response = await http.get(Uri.parse("${Config.baseUrl}systemapi"));
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        withdrawTimeFrom.value = data['data'][0]['withdraw_time_from'];
        withdrawTimeTo.value = data['data'][0]['withdraw_time_to'];
        whatsappNumber.value = data['data'][0]['whatsapp'].toString();

        log("Withdrawal time fetched: $withdrawTimeFrom - $withdrawTimeTo");
        log("Whatsapp number: $whatsappNumber");
        checkTime();
      }
    } catch (e) {
      log("There is an error in widrawal time $e");
    }
  }
 void checkTime() {
  if (withdrawTimeFrom.value.isNotEmpty && withdrawTimeTo.value.isNotEmpty) {
    try {
      
      final currentTime = DateFormat('HH:mm').format(DateTime.now());
      
      final fromTime = withdrawTimeFrom.value;
      final toTime = withdrawTimeTo.value;

      log("Current Time: $currentTime");
      log("From Time: $fromTime");
      log("To Time: $toTime");

      if (currentTime.compareTo(fromTime) >= 0 && currentTime.compareTo(toTime) <= 0) {
        showButton.value = true;
        log("Withdraw is allowed.");
      } else {
        showButton.value = false;
        log("Withdraw is only available from $fromTime to $toTime");
       // Get.snackbar('Notice', 'Withdraw is only available from $fromTime to $toTime');
      }
    } catch (e) {
      log("Error parsing withdrawal time: $e");
      Get.snackbar('Error', 'Invalid withdrawal time format.');
    }
  }
}


}
