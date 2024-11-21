import 'package:flutter/material.dart';
import 'package:newsapp_project/style/textStyle.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.7,
                width: screenWidth * 0.95,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(image:AssetImage("images/pic1.jpg"),fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                ),
              ),
    ),
    ),

    SizedBox(height: 30),
    Center(
    child: Text(
    '''News from around the world for you''',
    style: AppTextStyle.heading,
    ),
    ),
    SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Center(
    child: Text(
    '''Best time to read, take your time to read a
little more of this world''',
    style: AppTextStyle.subHeading,
    textAlign: TextAlign.center,
    ),
    ),
    ),
    SizedBox(height: 20),
    Center(
    child: Container(
    height: screenHeight * 0.07,
    width: screenWidth * 0.6,
    child: ElevatedButton(
    onPressed: () {
    // Navigator.of(context).push(
    // MaterialPageRoute(builder: (context) => HomePage()),
    // );
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
    ]
      ),
    );
  }
}
