import 'package:covid_app/widgets/appDrawer.dart';
import 'package:covid_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class AnalisisScreen extends StatefulWidget {
  const AnalisisScreen({Key? key}) : super(key: key);

  @override
  State<AnalisisScreen> createState() => _AnalisisScreenState();
}

class _AnalisisScreenState extends State<AnalisisScreen> {
  late InAppWebViewController _webViewController;

  Future webViewMethod() async {
    print("permission granted");
    await Permission.phone.request();
  }

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webViewMethod();
  }

  @override
  Widget build(BuildContext context) {
    const url = "http://1932-2402-4000-2380-6473-e5c6-5f69-82f4-2604.ngrok.io";
    return Scaffold(
      key: _key,
      appBar: CustomAppBar(_key),
      drawer: AppDrawer(),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url)),
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              )),
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
    );
  }
}
