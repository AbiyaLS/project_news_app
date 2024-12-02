import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/components/category_tile.dart';
import 'package:newsapp_project/components/slider_tile.dart';
import 'package:newsapp_project/components/trending_news.dart';
import 'package:newsapp_project/models/article_model.dart';
import 'package:newsapp_project/models/category_model.dart';
import 'package:newsapp_project/models/slider_model.dart';
import 'package:newsapp_project/services/data.dart';
import 'package:newsapp_project/services/news.dart';
import 'package:newsapp_project/services/slider_data.dart';
import 'package:newsapp_project/style/textStyle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles=[];
  bool _isLoading=true;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getSliders();
    getNews();
  }

  // for the Trending News section
  void getNews()async{
    News newsclass=News();
    await newsclass.getNews();
    articles=newsclass.news;
    print("Number of articles fetched: ${articles.length}");
    setState(() {
      _isLoading=false;
    });
  }

  // for the Slider News section
  void getSliders()async{
    SliderData slidersdata= SliderData();
    await slidersdata.getSliders();
    sliders=slidersdata.slider;
    print("Number of articles fetched: ${articles.length}");
    setState(() {
      _isLoading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("News App"),),
      body: _isLoading? Center(
        child:
        Container(constraints: BoxConstraints(
          maxWidth: 250,
          maxHeight: 300,
        ),child: Lottie.asset("assets/loading.json")),
      ) : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.1,
                padding: EdgeInsets.only(left: 8),
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
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
                height: 5,
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
                height: 8,
              ),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String resultImage = sliders[index].urlToImage!;
                    String resultName = sliders[index].title!;
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
              SizedBox(height: 20,),
              buildIndicator(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending News",
                      style: AppTextStyle.heading,
                    ),
                    Text(
                      "View All",
                      style: AppTextStyle.viewAll,
                      selectionColor: Colors.indigo.shade700,
                    )
                  ],),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return TrendingNews(
                      imageUrl: articles[index].urlToImage ?? 'https://via.placeholder.com/150',
                      title: articles[index].title ?? 'No Title Available',
                      descript: articles[index].description ?? 'No Description Available',
                      url: articles[index].url ?? '',
                    );
                  },
                ),
              )
        
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator() =>
      AnimatedSmoothIndicator(activeIndex: activeIndex, count: 5,
      effect: JumpingDotEffect(dotWidth: 10,dotHeight: 10,activeDotColor: Colors.indigo,dotColor: Colors.grey.shade400),);
}
