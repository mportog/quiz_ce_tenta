import 'package:flutter/material.dart';

class MenuGridItemCard extends StatelessWidget {
  MenuGridItemCard(
      this.cardIcon, this.iconColor, this.titleCard, this.columnChild);
  final IconData cardIcon;
  final String titleCard;
  final List<Widget> columnChild;
  final MaterialColor iconColor;
  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height * 0.4;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(cardIcon, color: iconColor, size: itemHeight * 0.4),
            Text(titleCard, style: TextStyle(fontSize: itemHeight * 0.1)),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: columnChild)
          ]),
    );
  }
}
