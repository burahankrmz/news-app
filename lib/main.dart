import 'package:flutter/material.dart';
import 'package:news/screen/mainscreen.dart';
import 'package:news/viewmodel/listviewnewsmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListViewNewsModel(),
          ),
        ],
        child: NewsScreen(),
      ),
    );
  }
}
