import 'dart:convert';
import 'package:newsapp_project/models/article_model.dart';
import 'package:http/http.dart' as http;
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-11-02&sortBy=publishedAt&apiKey=582c5d461d614004b8be432bad49c84b";

    try {
      news.clear();
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null && element["description"] != null) {
              ArticleModel articleModel = ArticleModel(
                title: element["title"],
                description: element["description"],
                url: element["url"],
                urlToImage: element["urlToImage"],
                content: element["content"],
                author: element["author"],
              );
              news.add(articleModel);
            }
          });
      } else {
        print("API response error: ${jsonData["message"]}");
      }
      } else if (response.statusCode == 426) {
        print("Upgrade Required: Server requires protocol upgrade.");
      } else {
        print("Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching news: $e");
    }
  }
}

