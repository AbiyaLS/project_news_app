import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  String trendingUrl;
   ArticleWebView({super.key,required this.trendingUrl});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"),),
      body: Container(
        child: WebView(
          initialUrl: widget.trendingUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
