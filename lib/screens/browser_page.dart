import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({ Key? key }) : super(key: key);

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
final link = "https://www.youtube.com";

WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
      if(await _controller!.canGoBack()) {
        _controller!.goBack();
      }
        return false;
      },
      child: Scaffold(
        body: WebView(
       initialUrl: link, 
      javascriptMode: JavascriptMode.unrestricted,  
      onWebViewCreated: (controller) {
        setState(() {
          _controller = controller;
        });
         },
        ),
      ),
    );
  }
} 