import 'dart:convert';
import 'package:http/http.dart' as http;

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) =>
      Sources(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        url: url ?? this.url,
        category: category ?? this.category,
        language: language ?? this.language,
        country: country ?? this.country,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "url": url,
      "category": category,
      "language": language,
      "country": country,
    };
  }

  Sources.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        description = json["description"] ?? "",
        url = json["url"] ?? "",
        category = json["category"] ?? "",
        language = json["language"] ?? "",
        country = json["country"] ?? "";
}

class SourceResponse {
  String? status;
  List<Sources>? sources;
  String? code;
  String? message;

  SourceResponse({this.status, this.sources, this.code, this.message});

  SourceResponse copyWith({
    String? status,
    List<Sources>? sources,
    String? code,
    String? message,
  }) =>
      SourceResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "code": code,
      "message": message,
      "sources": sources?.map((v) => v.toJson()).toList(),
    };
  }

  SourceResponse.fromJson(Map<String, dynamic> json)
      : status = json["status"] ?? "",
        code = json["code"] ?? "",
        message = json["message"] ?? "",
        sources = (json["sources"] as List?)
                ?.map((v) => Sources.fromJson(v as Map<String, dynamic>))
                .toList() ??
            [];
}
