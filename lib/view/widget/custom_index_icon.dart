import 'package:flutter/material.dart';

class CustomNotificationIndex extends StatelessWidget {
  CustomNotificationIndex(this.labelString, this.indexString);
  final Widget labelString;
  final String indexString;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(child: labelString),
        Positioned(
          top: 0.5,
          left: -2,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              indexString,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
