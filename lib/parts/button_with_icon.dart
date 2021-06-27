import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;  //定数でないといけないのでvar--->final
  final Icon icon;
  final String label;
  final Color color;

  //コンスタクタの引数値として渡す
  ButtonWithIcon(
      {required this.onPressed,
        required this.icon,
        required this.label,
        required this.color,
        l});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: color,//変数定義
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )
            ),
            onPressed: onPressed,
            icon: icon,
            label:Text(label,style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}
