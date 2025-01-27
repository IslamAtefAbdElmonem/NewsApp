import 'package:flutter/material.dart';
import 'package:project3/model/SourceResponse.dart';
import 'package:project3/news.dart';
import 'package:project3/sourceItems.dart';
import 'package:project3/utilties/app_colors.dart';
import 'package:project3/app_theme.dart';

class SourceTab extends StatefulWidget {
  List<Sources> sourcesList = [];

  SourceTab({required this.sourcesList}) {}

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Theme.of(context).indicatorColor,
                dividerColor: AppColors.transparent,
                tabs: widget.sourcesList.map((source) {
                  return SourceItems(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source));
                }).toList()),
            Expanded(
                child: NewsWidegt(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
