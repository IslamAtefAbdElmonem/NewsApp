import 'package:flutter/material.dart';
import 'package:project3/model/SourceResponse.dart';
import 'package:project3/utilties/app_colors.dart';

class SourceItems extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItems({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? "",
        style: isSelected
            ? Theme.of(context).textTheme.headlineLarge
            : Theme.of(context).textTheme.headlineMedium);
  }
}
