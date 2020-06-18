import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard(this.cardIcon, this.iconColor, this.iconPressed, this.titleCard,
      this.columnChild);
  final IconData cardIcon;
  final String titleCard;
  final List<Widget> columnChild;
  final MaterialColor iconColor;
  final void Function() iconPressed;
  @override
  Widget build(BuildContext context) {
    final itemHeight = MediaQuery.of(context).size.height * 0.4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Container(
          height: itemHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: iconPressed,
                  child:
                      Icon(cardIcon, color: iconColor, size: itemHeight * 0.4),
                ),
                Text(titleCard, style: TextStyle(fontSize: itemHeight * 0.1)),
                Column(children: columnChild)
              ]),
        ),
      ),
    );
  }
}
