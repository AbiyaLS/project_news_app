import 'package:flutter/material.dart';
import 'package:newsapp_project/components/category_tile.dart';
import 'package:newsapp_project/models/category_model.dart';
import 'package:newsapp_project/services/data.dart';
import 'package:newsapp_project/style/textStyle.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.1,
              padding: EdgeInsets.only(left: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].image,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
