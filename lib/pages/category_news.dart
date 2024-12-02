import 'package:flutter/material.dart';
import 'package:newsapp_project/components/show_category.dart';
import 'package:newsapp_project/models/show_category_model.dart';
import 'package:newsapp_project/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {

  String name;
  CategoryNews({super.key,required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _isLoading = true;


  @override
  void initState() {
    getNews();
    super.initState();
  }

  // show each categories of news
  void getNews()async{
    ShowCategoryNews showCategoryNews=ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories=showCategoryNews.categoryNews;
    // print("Number of articles fetched: ${categories.length}");
    setState(() {
      _isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ShowCategory(
              image: category.urlToImage ?? 'default_image_url',
              desc: category.description ?? 'Description not available',
              title: category.title ?? 'Title not available',
            );
          },
        ),
      ),

    );
  }
}
