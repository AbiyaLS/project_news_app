import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp_project/models/slider_model.dart';
class SliderData {
  List<SliderModel> slider = [];

  Future<void> getSliders() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=582c5d461d614004b8be432bad49c84b";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData["status"] == "ok") {
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null && element["description"] != null) {
              SliderModel sliderModel = SliderModel(
                title: element["title"],
                description: element["description"],
                url: element["url"],
                urlToImage: element["urlToImage"],
                content: element["content"],
                author: element["author"],
              );
              slider.add(sliderModel);
            }
          });
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

