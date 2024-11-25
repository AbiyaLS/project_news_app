import 'dart:ui';

import 'package:flutter/material.dart';


class AppTextStyle{

  static const TextStyle heading =TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subHeading =TextStyle(
    color: Colors.black45,
    fontSize: 18,
  );

  static const TextStyle sliderImageText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold
  );

  static const TextStyle viewAll = TextStyle(
      color: Colors.indigo,
      fontSize: 15,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: Colors.indigo

  );
}