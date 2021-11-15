import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/appDrawer.dart';
import '../widgets/custom_app_bar.dart';

class AnalisisScreen extends StatefulWidget {
  const AnalisisScreen({Key? key}) : super(key: key);

  @override
  State<AnalisisScreen> createState() => _AnalisisScreenState();
}

class _AnalisisScreenState extends State<AnalisisScreen> {
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
    final url = dotenv.env['COUGH_ANALYSIS'];
    return Scaffold(
      key: _key,
      appBar: CustomAppBar(_key),
      drawer: AppDrawer(),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url!)),
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
              ),
              android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
              )),
          onWebViewCreated: (InAppWebViewController controller) {},
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
