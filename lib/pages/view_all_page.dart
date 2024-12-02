import 'package:flutter/material.dart';
import 'package:newsapp_project/components/viewall_section.dart';
import 'package:newsapp_project/models/article_model.dart';
import 'package:newsapp_project/models/slider_model.dart';
import 'package:newsapp_project/services/news.dart';
import 'package:newsapp_project/services/slider_data.dart';

class ViewAllPage extends StatefulWidget {
  final String news;

  const ViewAllPage({
    super.key,
    required this.news,
  });

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _isLoading = true;

  @override
  void initState() {
    getNews();
    getSliders();
    super.initState();
  }

  // for the Trending News section
  void getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    print("Number of articles fetched: ${articles.length}");
    setState(() {
      _isLoading = false;
    });
  }

// for the Slider News section
  void getSliders() async {
    SliderData slidersdata = SliderData();
    await slidersdata.getSliders();
    sliders = slidersdata.slider;
    print("Number of articles fetched: ${articles.length}");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news+" News"),
      ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.news == "Breaking" ? sliders.length : articles.length,
            itemBuilder: (context, index) {
              return ViewallSection(
                image: widget.news == "Breaking" ?sliders[index].urlToImage! :articles[index].urlToImage!,
                desc: widget.news == "Breaking" ?sliders[index].description! : articles[index].description!,
                title: widget.news == "Breaking" ?sliders[index].title! : articles[index].title!,
                url: widget.news == "Breaking" ?sliders[index].url! : articles[index].url!,
              );
            },
          ),
        ));
  }
}
