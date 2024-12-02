import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowCategory extends StatefulWidget {
  String image;
  String desc;
  String title;

  ShowCategory(
      {super.key,
      required this.image,
      required this.desc,
      required this.title});

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
          imageUrl: widget.image,
          width: screenWidth,
          height: screenHeight * 0.2,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.broken_image,
            size: 50,
            color: Colors.grey,
          ),
                ),
        ),
          Text(widget.desc),
          Text(widget.title)
        ],
      ),
    );
  }
}
