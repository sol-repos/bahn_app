import 'package:webview_flutter/webview_flutter.dart';

class BahnExpertWebViewController {
  static WebViewController? _controller;

  static WebViewController get controller {
    if (_controller == null) {
      return _init();
    } else {
      return _controller!;
    }
  }

  static WebViewController _init() {
    return _controller = WebViewController()
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
      );
  }

  static void _runSiteModifications() async {
    // TODO: Snackbar is still shown, fix
    await controller.runJavaScript(
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

  static Future<void> loadPath(String path) {
    final uri = Uri.https('bahn.expert', path);
    return controller.loadRequest(uri);
  }
}