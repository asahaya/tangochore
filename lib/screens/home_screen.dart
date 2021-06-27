import 'package:flutter/material.dart';
import 'package:tangochore/parts/button_with_icon.dart';
import 'package:tangochore/screens/test_screen.dart';
import 'package:tangochore/screens/word_list_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //RadioButton選択肢
  //暗記済みの単語を渡すか？
  bool radioSentaku = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/image_title.png")),
            _titleText(),
            //TODO 横線
            Divider(
              color: Colors.white,
              height: 40, //線の上下等間隔で余白が開く
              indent: 8, //左余白
              endIndent: 8, //右余白
            ),
            //TODO 確認ボタン
            ButtonWithIcon(
              onPressed: () => _startTextScreen(context),
              icon: Icon(Icons.play_arrow_outlined),
              label: "確認テストをする",
              color: Colors.yellow,
            ),
            SizedBox(
              height: 30,
            ),
            // TODO ラジオボタン
            _radioButtons(),
            SizedBox(
              height: 30,
            ),
            //TODO　単語一覧を見るボタン
            ButtonWithIcon(
              onPressed: () => _startWordListScreen(context),
              icon: Icon(Icons.list),
              label: "単語一覧を見る",
              color: Colors.brown,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "powered by Hayata Asano 2021.06.27",
              style: TextStyle(fontSize: 10, fontFamily: "Mont"),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _titleText() {
    return Column(
      children: [
        Text(
          "私だけの単語帳",
          style: TextStyle(fontSize: 25),
        ),
        Text(
          "My Own Frashca",
          style: TextStyle(fontSize: 20, fontFamily: "Mont"),
        ),
      ],
    );
  }

  //RadioButtonは4要素がないとエラ－が起こる
  Widget _radioButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: Column(
        children: [
          RadioListTile(
            title: Text(
              "暗記済みの単語を除外する",
              style: TextStyle(fontSize: 16),
            ),
            value: false, //暗記済みの単語を渡さない radioSentaku
            groupValue: radioSentaku,
            onChanged: (value) => _onRadioSelected(value),
          ),
          RadioListTile(
            title: Text(
              "暗記済みの単語を含む",
              style: TextStyle(fontSize: 16),
            ),
            value: true, //暗記済みの単語を渡す radioSentaku
            groupValue: radioSentaku,
            onChanged: (value) => _onRadioSelected(value),
          ),
        ],
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      radioSentaku = value;
      print("$valueが選ばれた");
    });
  }

  _startWordListScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WordListScreen()));
  }

  _startTextScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestScreen(
          //値を渡す
          radioSentaku: radioSentaku,
        ),
      ),
    );
  }
}
