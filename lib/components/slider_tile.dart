import 'package:flutter/material.dart';
import 'package:newsapp_project/style/textStyle.dart';

Widget buildImage(BuildContext context, String image, int index, String name) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Text(name,style: AppTextStyle.sliderImageText,),
        )
      ]),
    );
