import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_project/style/textStyle.dart';

Widget buildImage(BuildContext context, String image, int index, String name) {
  final double height = MediaQuery.of(context).size.height * 0.3;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            height: height,
            width: double.infinity,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: AppTextStyle.sliderImageText,
            ),
          ),
        ),
      ],
    ),
  );
}
