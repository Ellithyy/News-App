import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/models/article_model.dart';
import 'package:news_app_c10_mon/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSource(String categoryId) async {
    Map<String, dynamic> queryParams = {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    };

    Uri url = Uri.https(
      Constants.baseURL,
      "/v2/top-headlines/sources",
      queryParams,
    );

    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List sourcesList = data["sources"];

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.formJson(element));
      }

      return sourcesDataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Sources');
    }
  }

  static Future<List<ArticleModel>> fetchDataArticles(String sourceId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };
    var url = Uri.https(
      Constants.baseURL,
      "/v2/everything",
      queryParameters,
    );

    var response = await http.get(url);

    List<ArticleModel> articlesList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data["articles"];

      for (var element in articles) {
        articlesList.add(
          ArticleModel.fromJson(element),
        );
      }
      return articlesList;
    } else {
      throw Exception("Error fetch data articles: ");
    }
  }
}