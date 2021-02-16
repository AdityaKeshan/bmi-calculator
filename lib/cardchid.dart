import 'package:flutter/material.dart';
class CardChild extends StatelessWidget {
  final Color textColor;
  final FontWeight fontWeigh;
  final String text;
  final double size;
  final Icon icon;
  CardChild({this.textColor, this.text, this.size, this.icon,this.fontWeigh});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,

          style: TextStyle(fontSize: size, color: textColor,fontWeight: fontWeigh),
        ),
      ],
    );
  }
}