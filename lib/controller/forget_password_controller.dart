import 'dart:convert';
import 'dart:developer';

import 'package:bpro/config/config.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordController extends GetxController {
  var email = TextEditingController();
  var loading = false.obs;
  Future forgetPassword() async {
    try {
      loading(true);
      var url = Uri.parse("${Config.baseUrl}forgetpassword");
      var body = json.encode({"email": email.text});
      log("URL $url");
      log("email: ${email.text}");

      var response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      log("${response.statusCode}");
      if (response.statusCode == 200) {
        email.clear();
        Get.snackbar(
          "Success",
          "A password reset link has been sent to your email.",
          backgroundColor: AppColors.appPrimaryColor,
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      log("Exception $e");
    } finally {
      loading(false);
    }
  }
}
