import 'package:flutter/material.dart';
import 'package:project3/utilties/app_colors.dart';

class DrawerItems extends StatelessWidget {
  String image;
  String text;

  DrawerItems({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      child: Row(
        children: [
          ImageIcon(AssetImage(image), color: AppColors.whiteColor),
          Text(text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor))
        ],
      ),
    );
  }
}
