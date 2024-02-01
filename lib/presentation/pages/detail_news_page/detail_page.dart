


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailNewPage extends StatefulWidget {
  String? url;
  DetailNewPage({required this.url});

  @override
  _DetailNewPageState createState() {
    return _DetailNewPageState(url!);
  }
}

class _DetailNewPageState extends State<DetailNewPage> {
  late WebViewController _controller;
  late String _url;

  _DetailNewPageState(this._url); // Gantilah dengan URL yang diinginkan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Webview'),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: WebView(
        initialUrl: _url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan fungsi untuk me-refresh halaman WebView
          if (_controller != null) {
            _controller.reload();
          }
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}