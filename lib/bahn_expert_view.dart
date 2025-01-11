import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BahnExpertView extends StatefulWidget {
  const BahnExpertView({super.key, required this.path});

  final String path;

  @override
  State<BahnExpertView> createState() => _BahnExpertViewState();
}

class _BahnExpertViewState extends State<BahnExpertView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final pathWithLeadingBackslash = widget.path.startsWith('/') ? widget.path : '/${widget.path}';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            _runSiteModifications();
          },
          onNavigationRequest: (NavigationRequest request) {
            print('Navigation request: ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://bahn.expert$pathWithLeadingBackslash'));
  }

  void _runSiteModifications() async {
    await _controller.runJavaScript(
      """
      function runSiteModifications() {
        var header = document.querySelector('header');
        var headerDiv = document.querySelector('.css-o5q8sw');
        if (header && headerDiv) {
          header.style.display = 'none';
          headerDiv.style.display = 'none';
        }
        var snackbar = document.querySelector('.MuiSnackbar-root')
        if (snackbar) {
          snackbar.style.display = 'none';
        }
      }
      runSiteModifications();
      document.addEventListener("DOMContentLoaded", function(event){
        runSiteModifications();
      });
      """
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}

