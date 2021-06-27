import 'package:flutter/material.dart';
import 'package:tangochore/screens/home_screen.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "単語帳",
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Lanobe",  //標準フォント設定
      ),
      home: HomeScreen(),
    );
  }
}
