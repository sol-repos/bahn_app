import 'package:bahn_app/domain/bahn_expert_web_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BahnExpertWebView extends StatefulWidget {
  const BahnExpertWebView({super.key, required this.path});

  final String path;

  @override
  State<BahnExpertWebView> createState() => _BahnExpertWebViewState();
}

class _BahnExpertWebViewState extends State<BahnExpertWebView> {

  @override
  void initState() {
    super.initState();
    BahnExpertWebViewController.loadPath(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: BahnExpertWebViewController.controller);
  }
}

