import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project3/model/NewResponse.dart';
import 'package:project3/news.dart';
import 'package:project3/utilties/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItems extends StatelessWidget {
  Articles news;

  NewsItems({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: Theme.of(context).indicatorColor, width: 2)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColors.greyColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By :${news.author ?? ''}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Text(
                _calculateMinutesAgo(news.publishedAt ?? ""),
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}

String _calculateMinutesAgo(String publishedAt) {
  try {
    final publishedDate = DateTime.parse(publishedAt);
    final now = DateTime.now();
    final difference = now.difference(publishedDate).inHours;

    if (difference == 1) {
      return "$difference minute ago";
    } else {
      return "$difference minutes ago";
    }
  } catch (e) {
    return "Invalid date";
  }
}
