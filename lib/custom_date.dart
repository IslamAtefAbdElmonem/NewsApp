import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

// Custom Messages Class to Show Time in Minutes
class CustomMinuteMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ago';
  @override
  String suffixFromNow() => 'from now';
  @override
  String lessThanOneMinute(int seconds) => 'just now';
  @override
  String aboutAMinute(int minutes) => '1 minute ago';
  @override
  String minutes(int minutes) => '$minutes minutes ago';
  @override
  String aboutAnHour(int minutes) => '${minutes ~/ 60} hours ago';
  @override
  String hours(int hours) => '${hours * 60} minutes ago';
  @override
  String aDay(int hours) => '${hours * 60} minutes ago';
  @override
  String days(int days) => '${days * 24 * 60} minutes ago';
  @override
  String weeks(int weeks) => '${weeks * 7 * 24 * 60} minutes ago';
  @override
  String aMonth(int days) => '${days * 24 * 60} minutes ago';
  @override
  String months(int months) => '${months * 30 * 24 * 60} minutes ago';
  @override
  String aYear(int years) => '${years * 365 * 24 * 60} minutes ago';
  @override
  String years(int years) => '${years * 365 * 24 * 60} minutes ago';

  @override
  String aboutAMonth(int days) {
    // TODO: implement aboutAMonth
    throw UnimplementedError();
  }

  @override
  String aboutAYear(int year) {
    // TODO: implement aboutAYear
    throw UnimplementedError();
  }

  @override
  String wordSeparator() {
    // TODO: implement wordSeparator
    throw UnimplementedError();
  }
}

class NewsWidget extends StatelessWidget {
  final String? publishedAt;

  NewsWidget({required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    // Register Custom Messages for Locale
    timeago.setLocaleMessages('en_custom', CustomMinuteMessages());

    return Text(
      timeago.format(
        DateTime.parse(publishedAt ?? DateTime.now().toIso8601String()),
        locale: 'en_custom',
      ),
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
