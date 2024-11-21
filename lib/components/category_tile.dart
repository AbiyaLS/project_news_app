import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  final String categoryName;

  const CategoryTile(
      {super.key, required this.image, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              fit: BoxFit.cover,  // Changed to BoxFit.cover
              width: 130,
              height: 70,
            ),
          ),
          Container(
            width: 130,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),  // Added padding to text
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,  // Optional, makes text stand out
                  ),
                  textAlign: TextAlign.center,  // Centers the text
                  overflow: TextOverflow.ellipsis,  // Handles long text
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
