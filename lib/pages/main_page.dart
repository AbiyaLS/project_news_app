import 'package:flutter/material.dart';
import 'package:newsapp_project/pages/home_page.dart';
import 'package:newsapp_project/style/textStyle.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/pic1.jpg",
                  fit: BoxFit.fill,
                  height: screenHeight* 0.76,
                  width: screenWidth,
                ),
              ),
            ),
          ),

          Positioned(
            top: screenHeight / 1.5- 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: screenHeight * 0.37,
                width: screenWidth * 0.8,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'News from around the\n         world for you',
                      style: AppTextStyle.heading,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Best time to read, take your time to read\n      little more of this world",
                      style: AppTextStyle.subHeading,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.75,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.indigo),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
