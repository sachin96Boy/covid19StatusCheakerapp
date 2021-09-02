import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_app_bar.dart';

class InformationScreen extends StatefulWidget {
  static const routeName = '/informationScreen';

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late InAppWebViewController _webViewController;

  Future webViewMethod() async {
    print('In Microphone permission method');
    //WidgetsFlutterBinding.ensureInitialized();
    // WidgetsFlutterBinding.ensureInitialized();

    await Permission.microphone.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webViewMethod();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const url = "https://vocaroo.com/";
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url)),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
            ),
            android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
            ),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
        ),
      ),
      // WebView(
      //   initialUrl: url,

      //   javascriptMode: JavascriptMode.unrestricted,
      //   allowsInlineMediaPlayback: true,
      //   gestureNavigationEnabled: true,
      //   debuggingEnabled: true,
      //   initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      //   onProgress: (int progress) {
      //     CircularProgressIndicator(
      //       color: Colors.amber,
      //     );
      //     print('loading :$progress');
      //   },
      // ),
    );
  }
}
