import 'package:flutter/material.dart';
import 'package:tangochore/screens/edit_screen.dart';


class WordListScreen extends StatefulWidget {
  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //前の画面を持っている場合は自動で戻るボタンが組み込まれる
        appBar: AppBar(
          title: Text("単語一覧"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewWord(),
          child: Icon(Icons.add),
          tooltip: "新しい単語の登録",
        ),
        body: Center(
          child: Text("単語一覧"),
        ));
  }

  //情報更新をするためにWordListScreenを一回消して、
  // 単語追加画面を開けたい、popメソッドでメイン画面に戻る
  _addNewWord() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => EditScreen()));
  }
}