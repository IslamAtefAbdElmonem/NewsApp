import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project3/api/apiManager.dart';
import 'package:project3/category_model.dart';
import 'package:project3/model/SourceResponse.dart';
import 'package:project3/sourceTab.dart';
import 'package:project3/utilties/app_colors.dart';
import 'package:project3/app_theme.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSource(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSource(widget.category.id);
                  setState(() {});
                },
                child: Text("Try Again",
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            ],
          );
        }

        if (snapshot.data == null || snapshot.data!.status != "ok") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? "An unexpected error occurred."),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSource(widget.category.id);
                  print(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  "Try Again",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          );
        }

        var sourcesList = snapshot.data!.sources!;
        return SourceTab(sourcesList: sourcesList);
      },
    );
  }
}
