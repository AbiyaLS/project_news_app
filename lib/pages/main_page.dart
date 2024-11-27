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
      backgroundColor: Colors.grey.shade100,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
            children: [
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "assets/pic1.jpg", fit: BoxFit.fill,
                        height:screenHeight/1.7,
                      width: screenWidth,)
                                ),
                ),
              SizedBox(height: 30),
              Text(
                '''News from around the\n         world for you''',
                style: AppTextStyle.heading,
              ),
              SizedBox(height: 10),
               Text(
                  "Best time to read, take your time to read\n      little more of this world",
                  style: AppTextStyle.subHeading,
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 30),
              Center(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.6,
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
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
