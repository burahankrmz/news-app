import 'package:flutter/cupertino.dart';
import 'package:news/model/modelnews.dart';
import 'package:news/service/service.dart';
import 'package:news/viewmodel/viewmodel.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class ListViewNewsModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;

  // ignore: deprecated_member_use
  List<ViewNewsModel> articles = List<ViewNewsModel>();

  void fetchTopNewsHeadline() async {
    // ignore: deprecated_member_use
    List<ModelNewsArticle> _newsarticle = await WebService().getTopHeadlines();
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.articles =
        _newsarticle.map((article) => ViewNewsModel(article: article)).toList();

    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

  //methods for news from each country
  void fetchNewsByCountry(String country) async {
    // ignore: deprecated_member_use
    List<ModelNewsArticle> _newsarticle =
        await WebService().getNewsByCountry(country);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.articles =
        _newsarticle.map((article) => ViewNewsModel(article: article)).toList();

    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }
}
