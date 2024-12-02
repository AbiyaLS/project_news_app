import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String trendingUrl;

  ArticleWebView({super.key, required this.trendingUrl});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Article",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              WebView(
                initialUrl: widget.trendingUrl,
                javascriptMode: JavascriptMode.unrestricted,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.trendingUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Stack(),
        ],
      ),
    );
  }
}
