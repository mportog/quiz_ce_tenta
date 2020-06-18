import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  OptionCard(this.optionKey, this.value, this.setAnim);
  final String optionKey;
  final String value;
  final void Function() setAnim;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setAnim,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(child: Text(optionKey)),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(value),
          )
        ]),
      ),
    );
  }
}
