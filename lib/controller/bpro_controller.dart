import 'dart:developer';
import 'package:bpro/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:bpro/config/config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BproController extends GetxController {
  AuthController authController = Get.find();
  var loading = false.obs;
  

  var usernames = "";
  var userPassword = "";
  var check = false;
  var storage = GetStorage();
  int? userid;
  var weburl = "".obs;
  var userName = "".obs;
  var bpUserName = "".obs;
  var bpPassword = "".obs;
  var status = "";
  var token = "";
 @override
Future<void> onInit() async {
  super.onInit();
  await authController.getUserData();  
  userApi();
}


  Future launchUrl(String url, {String? phonenumber}) async {
    try {
      String fullUrl = url;
      if (phonenumber != null) {
        fullUrl = url + phonenumber;
      }
      var uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launch(fullUrl);
      }
    } catch (e) {
      log("There is an error $e");
    }
  }

  webView(String url) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  Future userApi() async {
    try {
      loading(true);
      var url = Uri.parse("${Config.baseUrl}userapi");
      log("THIS IS URL: $url");

      var body = jsonEncode({"user_id": authController.userkey});
      log("THIS IS REQUEST BODY: $body");

      var headers = {
        "Authorization": "Bearer ${authController.sessionkey}",
        "Content-Type": "application/json",
      };
      log("THIS IS REQUEST HEADERS: $headers");

      var response = await http.post(url, headers: headers, body: body);

      log("THIS IS RESPONSE STATUS: ${response.statusCode}");
      log("THIS IS RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        log("INSIDE the condition");
        var data = jsonDecode(response.body);
        weburl.value = data["URL"] ?? "";
        userName.value = data["Username"] ?? "";
        bpUserName.value = data["BPusername"] ?? "";
        bpPassword.value = data["BPpassword"] ?? "";

        log("This is web url: $weburl");
        log("This is Username: $userName");
        log("This is Username and Password: $bpPassword and $bpUserName");
      } else {
        log("API ERROR: ${response.statusCode} - ${response.body}");
      }
      update();
    } catch (e) {
      log("Exception $e");
    } finally {
      loading(false);
    }
  }
  
}
