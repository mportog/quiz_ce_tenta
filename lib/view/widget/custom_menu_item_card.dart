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
    return MaterialButton(
      onPressed: iconPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Card(
        // margin: EdgeInsets.symmetric(horizontal: 9),
        elevation: 5,
        color: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: itemHeight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(cardIcon, color: iconColor, size: itemHeight * 0.4),
                Text(titleCard,
                    style: TextStyle(fontSize: itemHeight * 0.09),
                    textAlign: TextAlign.center),
                Column(children: columnChild)
              ]),
        ),
      ),
    );
  }
}
