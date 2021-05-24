import 'package:flutter/material.dart';
import 'package:news/constant/constant.dart';
import 'package:news/viewmodel/listviewnewsmodel.dart';
import 'package:news/widgets/newsgrid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewNewsModel>(context, listen: false)
        .fetchTopNewsHeadline();
  }

  @override
  Widget build(BuildContext context) {
    var listviewnewsmodel = Provider.of<ListViewNewsModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text("Haberler"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (country) {
              listviewnewsmodel
                  .fetchNewsByCountry(Constants.Countries[country]);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: Dehele(listviewnewsmodel: listviewnewsmodel),
    );
  }
}

class Dehele extends StatelessWidget {
  const Dehele({
    Key key,
    @required this.listviewnewsmodel,
  }) : super(key: key);

  final ListViewNewsModel listviewnewsmodel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
          child: Text(
            "Headlines",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: NewsGrid(articles: listviewnewsmodel.articles),
        ),
      ],
    ));
  }
}
