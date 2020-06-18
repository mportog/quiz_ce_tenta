import 'package:flutter/material.dart';

class CustomTextSize extends StatelessWidget {
  CustomTextSize(this.txt, this.txtStyle);
  final TextStyle txtStyle;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: txtStyle, textAlign: TextAlign.center);
  }
}
