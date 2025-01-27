import 'package:flutter/material.dart';
import 'package:project3/utilties/app_colors.dart';
import 'package:project3/drawer_items.dart';

class DrawerShape extends StatelessWidget {
  Function onDrawerItemClick;

  DrawerShape({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: height * 0.10),
          color: AppColors.whiteColor,
          child: Text(
            "News App",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor),
          ),
        ),
        InkWell(
            onTap: () {
              onDrawerItemClick();
            },
            child: DrawerItems(
                image: "asset/images/Home 1.png", text: " GO To Home")),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.05,
          endIndent: width * 0.05,
        ),
        DrawerItems(
            image: "asset/images/roller-paint-brush.png", text: " Theme"),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: AppColors.whiteColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: AppColors.whiteColor,
              )
            ],
          ),
        ),
        DrawerItems(image: "asset/images/globe-alt.png", text: " Language"),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: AppColors.whiteColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "English",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: AppColors.whiteColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
