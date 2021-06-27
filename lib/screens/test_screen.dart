import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {

  //コンストラクタ値の受け取り
  final radioSentaku;
  TestScreen({required this.radioSentaku});


  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    var hantei=widget.radioSentaku;
    return Scaffold(
      body: Center(child: Text("testsc $hantei",style:TextStyle(fontSize: 20),)),
    );
  }
}
