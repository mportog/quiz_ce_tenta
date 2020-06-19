import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomeFunc {
  void shareApp(String text, String subject) {
    Share.share(text, subject: subject);
  }

  Future<void> alertModal(BuildContext context, String title,
      {List<Widget> content}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(child: ListBody(children: content)),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Fechar'))
          ],
        );
      },
    );
  }
}
