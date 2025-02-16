import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; 

class WebviewScreen extends StatelessWidget {
  const WebviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    WebViewController webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..loadRequest(Uri.parse('https://monmatics.com'));

    
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
