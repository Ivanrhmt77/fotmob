import 'dart:convert';

import 'package:fotmob/models/article_response.dart';
import 'package:http/http.dart' as http;

class Client {
  static Future<List<Article>> fetchArticle(String topic) async {
    final url =
        "https://newsapi.org/v2/everything?q=$topic&apiKey=f1adb422bcf5454f9b75074e32e59bf4";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ResponseArticles responseArticles = ResponseArticles.fromJson(
        responseBody,
      );
      return responseArticles.articles;
    } else {
      throw Exception('Failed to load article');
    }
  }
}
