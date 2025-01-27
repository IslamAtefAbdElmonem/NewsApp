import 'package:flutter/material.dart';
import 'package:project3/api/apiManager.dart';
import 'package:project3/model/NewResponse.dart';
import 'package:project3/model/SourceResponse.dart';
import 'package:project3/news_items.dart';
import 'package:project3/utilties/app_colors.dart';

class NewsWidegt extends StatefulWidget {
  Sources source;

  NewsWidegt({required this.source});

  @override
  State<NewsWidegt> createState() => _NewsWidegtState();
}

class _NewsWidegtState extends State<NewsWidegt> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(children: [
              Text(
                "Something went Wrong.",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: Text(
                    "Try again",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
            ]);
          }
          if (snapshot.data!.status != "ok") {
            return Column(children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: Text(
                    "Try again",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
            ]);
          }
          var newsList = snapshot.data!.articlesList!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItems(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        });
  }
}
