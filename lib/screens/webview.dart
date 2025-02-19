import 'package:bpro/controller/bpro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  WebviewScreen({super.key});
  final BproController bproController = Get.find();
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(bproController.weburl.toString()));

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
