import 'package:news/constant/constant.dart';
import 'package:news/model/modelnews.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WebService {
  // for top headlines
  Future<List<ModelNewsArticle>> getTopHeadlines() async {
    final response = await http.get(Uri.parse(Constants.TOPHEADLINES));

    if (response.statusCode == 200) {
      // 200 represent successful response
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('response failed');
    }
  }

  Future<List<ModelNewsArticle>> getNewsByCountry(String country) async {
    final response =
        await http.get(Uri.parse(Constants.hedadlinesFor(country)));

    if (response.statusCode == 200) {
      // 200 represent successful response

      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('response failed');
    }
  }
}
