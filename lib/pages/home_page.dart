import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/components/category_tile.dart';
import 'package:newsapp_project/components/slider_tile.dart';
import 'package:newsapp_project/models/category_model.dart';
import 'package:newsapp_project/models/slider_model.dart';
import 'package:newsapp_project/services/data.dart';
import 'package:newsapp_project/services/slider_data.dart';
import 'package:newsapp_project/style/textStyle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    sliders = getSliders();
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Breaking News",
                    style: AppTextStyle.heading,
                  ),
                  Text(
                    "View All",
                    style: AppTextStyle.viewAll,
                    selectionColor: Colors.indigo.shade700,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder: (context, index, realIndex) {
                  String resultImage = sliders[index].sliderImage;
                  String resultName = sliders[index].sliderName;
                  return buildImage(context, resultImage, index, resultName);
                },
                options: CarouselOptions(
                    height: screenHeight * 0.3,
                    autoPlay: true,
                    // viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    })),
            SizedBox(height: 10,),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() =>
      AnimatedSmoothIndicator(activeIndex: activeIndex, count: sliders.length,
      effect: JumpingDotEffect(dotWidth: 10,dotHeight: 10,activeDotColor: Colors.indigo,dotColor: Colors.grey.shade400),);
}
