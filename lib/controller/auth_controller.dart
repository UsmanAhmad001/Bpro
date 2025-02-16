import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bpro/config/config.dart';
import 'package:bpro/screens/auth/login_screen.dart';
import 'package:bpro/screens/bprodashboard/bpro_dashboard_screen.dart';
import 'package:bpro/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var name = TextEditingController();
  var loading = false.obs;
  var loginusername = TextEditingController();
  var loginpassword = TextEditingController();
  var usernames = "";
  var userPassword = "";
  var username = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var check = false;
  var storage = GetStorage();
  var userStaus = "";
  int? userid;
  var userkey = "";
  var sessionkey = "";
  var weburl = "".obs;
  var userName = "".obs;
  var bpUserName = "".obs;
  var bpPassword = "".obs;
  var status = "";
  var token = "";
  var mode="";

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future userRegister() async {
    if (loading.value) return;
    try {
      loading(true);

      var url = Uri.parse("${Config.baseUrl}register");
      var body = json.encode({
        "name": name.text.trim(),
        "username": username.text.trim(),
        "email": email.text.trim(),
        "phone": phone.text.trim(),
        "password": password.text.trim(),
        "privacy": check
      });

      log("BODY: $body");

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      log("Response Body: ${response.body}");
      var data = json.decode(response.body);

      if (response.statusCode == 200 && data["status"] == 200) {
        Get.snackbar('Success', 'Successfully Registered',
            colorText: AppColors.white,
            backgroundColor: AppColors.appPrimaryColor);
        Get.to(LoginScreen());
      } else {
        log("Registration FAILED: $data");
        Get.snackbar('Error', 'Failed to Register. Please try again.',
            colorText: AppColors.white,
            backgroundColor: AppColors.charcoalgrey);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e',
          colorText: AppColors.white, backgroundColor: AppColors.charcoalgrey);
      log("Error during registration: $e");
    } finally {
      loading(false);
    }
  }

  Future userLogin() async {
  try {
    loading(true);
    var url = Uri.parse("https://betprowallet.com/api/login");
    var body = json.encode({
      "username": loginusername.text.trim(),
      "password": loginpassword.text.trim(),
    });

    var response = await http
        .post(url, headers: {"Content-Type": "application/json"}, body: body)
        .timeout(const Duration(seconds: 10)); // Timeout added

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      userid = data["user_id"];
      status = data["status"] ?? "";
      token = data["token"] ?? "";
      await saveUserData();
      log("LOGIN User ID: $userid");
      log("LOGIN Token: $token");
      log("LOGIN Status: $status");

      Get.snackbar('Success', data['message'],
          colorText: AppColors.white, backgroundColor: AppColors.appPrimaryColor);
      Get.to(() => BproDashboardScreen());
    } else {
      Get.snackbar('Error', 'Failed to login. Please try again.',
          colorText: AppColors.white, backgroundColor: AppColors.charcoalgrey);
    }
  } on SocketException catch (e) {
    Get.snackbar('Network Error', 'Please check your internet connection.',
        colorText: AppColors.white, backgroundColor: AppColors.charcoalgrey);
    log("Network Error: $e");
  } on TimeoutException catch (e) {
    Get.snackbar('Timeout', 'Request timed out. Try again later.',
        colorText: AppColors.white, backgroundColor: AppColors.charcoalgrey);
    log("Timeout Error: $e");
  } catch (e) {
    Get.snackbar('Error', 'Something went wrong: $e',
        colorText: AppColors.white, backgroundColor: AppColors.charcoalgrey);
    log("Login Error: $e");
  } finally {
    loading(false);
  }
}


  Future saveUserData() async {
    await storage.write("username", loginusername.text.trim());
    await storage.write("password", loginpassword.text.trim());
    await storage.write("token", token);
    await storage.write("userid", userid?.toString() ?? "");
    await storage.write("status", status);

    log("User Data Saved: Username: ${loginusername.text}, Password: ${loginpassword.text}, UserID: ${userid.toString()} and status $status");

    await getUserData();
  }

  Future getUserData() async {
    usernames = storage.read("username") ?? "";
    userPassword = storage.read("password") ?? "";
    userkey = storage.read("userid") ?? "";
    sessionkey = storage.read("token") ?? "";
    mode=storage.read("status")??"";

    log("Fetched Data:");
    log("Username: $usernames");
    log("Password: $userPassword");
    log("UserID: $userkey");
    log("Token: $sessionkey");
  }
}
