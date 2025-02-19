import 'package:bpro/controller/withdrawal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DisclaimerScreen extends StatelessWidget {
  DisclaimerScreen({super.key});
  final WithdrawalController withdrawalController = Get.find();
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(withdrawalController.disclaimer.toString()));

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("WebView Example"),
      // ),
      body: SafeArea(
        child: WebViewWidget(
          controller: webViewController,
        ),
      ),
    );
  }
}
