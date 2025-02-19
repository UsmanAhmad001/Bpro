import 'dart:convert';
import 'dart:developer';
import 'package:bpro/config/config.dart';
import 'package:bpro/controller/auth_controller.dart';
import 'package:bpro/screens/auth/login_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeleteAccountController extends GetxController {
  AuthController authController = Get.find();
  var loading = false.obs;
  var deleteAccounts = TextEditingController();
  var password = TextEditingController();
  Future deleteAccount() async {
    try {
      loading(true);
      var url = Uri.parse("${Config.baseUrl}deleteaccount");
      var body = json.encode({"user_id": authController.userkey});
      var response = await http.post(url,
          headers: {
            "Authorization": "Bearer ${authController.sessionkey}",
            "Content-Type": "application/json"
          },
          body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        password.clear();
        deleteAccounts.clear();

        log("Response:- $data");
        Get.snackbar("Success", "Your account delete successfully!",
            colorText: AppColors.white,
            backgroundColor: AppColors.appPrimaryColor);
        Get.to(LoginScreen());
      } else {
        log("API ERROR: ${response.statusCode} - ${response.body}");
        Get.snackbar('Error', 'Something went wrong .',
            colorText: AppColors.white,
            backgroundColor: AppColors.charcoalgrey);
      }
    } catch (e) {
      log("Delete Account Error: $e");
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again later.',
        colorText: AppColors.white,
        backgroundColor: AppColors.charcoalgrey,
      );
    } finally {
      loading(false);
    }
  }
}
