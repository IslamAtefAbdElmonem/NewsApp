import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:project3/api/api_constantce.dart';
import 'package:project3/api/end_points.dart';
import 'package:project3/model/NewResponse.dart';
import 'package:project3/model/SourceResponse.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=fdff6170ec884fe78212cd053e9a7aef

  static Future<SourceResponse> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstantce.baseUrl, EndPoints.sourcesApi,
        {"apiKey": ApiConstantce.apiKey, "category": categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstantce.baseUrl, EndPoints.newApi,
        {"apiKey": ApiConstantce.apiKey, "sources": sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
