import 'package:flutter/material.dart';
import 'package:tangochore/screens/word_list_screen.dart';


class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  //問題入力文字
  TextEditingController queController=TextEditingController();
  //答え入力文字
  TextEditingController ansController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope( //
      onWillPop: ()=>_backToWordScreen(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("新しい単語の登録"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          //キーボードで幅が足りない時に自動スクロールで表示エラーが起きない
          child: Column(
            children: [
              SizedBox(height: 20,),
              SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    "問題と答えを入力して「登録」ボタンを押してください",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //TODO 問題入力部分
              _questionInputPart(),
              SizedBox(height: 100,),
              //TODO 答え入力部分
              _answerInputPart(),
              SizedBox(height: 100,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Text("問題",style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          TextField(
            controller: queController,//入力した文字を変数化
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _answerInputPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Text("答え",style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          TextField(
            controller: ansController,//入力した文字を変数化
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<bool> _backToWordScreen() {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>WordListScreen()) );
    return Future.value(false);
  }
}
