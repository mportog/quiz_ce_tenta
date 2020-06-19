import 'package:auto_size_text/auto_size_text.dart';
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
            padding: EdgeInsets.all(8),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 120),
              child: AutoSizeText(
                value,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
                stepGranularity: 2,
                maxFontSize: 20,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
