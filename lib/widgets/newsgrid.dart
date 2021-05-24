import 'package:flutter/material.dart';
import 'package:news/screen/detailscreen.dart';
import 'package:news/viewmodel/listviewnewsmodel.dart';
import 'package:news/viewmodel/viewmodel.dart';
import 'package:news/widgets/circleImage.dart';

class NewsGrid extends StatelessWidget {
  List<ViewNewsModel> articles;

  NewsGrid({this.articles});

  void _ShowNewsDetailPage(BuildContext context, ViewNewsModel viewNewsModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return DetailScreen(viewNewsModel);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _ShowNewsDetailPage(context, article);
          },
          child: GridTile(
            child: Container(
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
