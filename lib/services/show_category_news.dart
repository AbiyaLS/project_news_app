import 'dart:convert';
import 'package:newsapp_project/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp_project/models/show_category_model.dart';
class ShowCategoryNews {
  List<ShowCategoryModel> categoryNews = [];

  Future<void>getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=582c5d461d614004b8be432bad49c84b";

    try {
      categoryNews.clear();
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null && element["description"] != null) {
              ShowCategoryModel showCategoryModel = ShowCategoryModel(
                title: element["title"],
                description: element["description"],
                url: element["url"],
                urlToImage: element["urlToImage"],
                content: element["content"],
                author: element["author"],
              );
              categoryNews.add(showCategoryModel);
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

