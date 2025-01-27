import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project3/categoryDetails.dart';
import 'package:project3/category_model.dart';
import 'package:project3/categoryfargment.dart';
import 'package:project3/drawer_shape.dart';
import 'package:project3/utilties/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home", style: Theme.of(context).textTheme.headlineSmall),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.blackColor,
          child: DrawerShape(
            onDrawerItemClick: onDrawerItemClick,
          ),
        ),
        body: selecetedCategory == null
            ? CategoryFragment(
                onView: onView,
              )
            : CategoryDetails(
                category: selecetedCategory!,
              ));
  }

  CategoryModel? selecetedCategory;

  void onView(CategoryModel newSelecetedCategory) {
    selecetedCategory = newSelecetedCategory;
    setState(() {});
  }

  onDrawerItemClick() {
    selecetedCategory = null;
    setState(() {});
  }

//   CategoryModel? selecetedCategory;

//   void onView(CategoryModel newSelecetedCategory) {
//     selecetedCategory = newSelecetedCategory;
//     setState(() {});
//   }
}
