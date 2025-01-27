import 'package:project3/model/SourceResponse.dart';

class Articles {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles copyWith(
          {Sources? source,
          String? author,
          String? title,
          String? description,
          String? url,
          String? urlToImage,
          String? publishedAt,
          String? content}) =>
      Articles(
          source: source ?? this.source,
          author: author ?? this.author,
          title: title ?? this.title,
          description: description ?? this.description,
          url: url ?? this.url,
          urlToImage: urlToImage ?? this.urlToImage,
          publishedAt: publishedAt ?? this.publishedAt,
          content: content ?? this.content);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

  Articles.fromJson(dynamic json) {
    source = json["source"] != null ? Sources.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}

class NewResponse {
  String? status;
  num? totalResults;
  List<Articles>? articlesList;
  String? code;
  String? message;

  NewResponse(
      {this.status,
      this.totalResults,
      this.articlesList,
      this.code,
      this.message});

  NewResponse copyWith(
          {String? status, num? totalResults, List<Articles>? articlesList}) =>
      NewResponse(
          status: status ?? this.status,
          totalResults: totalResults ?? this.totalResults,
          articlesList: articlesList ?? this.articlesList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articlesList != null) {
      map["articles"] = articlesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  NewResponse.fromJson(dynamic json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articlesList = [];
      json["articles"].forEach((v) {
        articlesList?.add(Articles.fromJson(v));
      });
    }
  }
}
