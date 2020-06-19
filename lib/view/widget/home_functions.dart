import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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

  List<Widget> infoApp = [
    ListTile(
        title: Text('GitHub'),
        enabled: true,
        leading: CircleAvatar(
            backgroundImage: Image.asset('assets/image/git_hub_logo.png').image,
            backgroundColor: Colors.white),
        onTap: () async => await launchInBrowser('https://github.com/mportog'),
        subtitle: Text('Página app dev Matheus P G')),
    ListTile(
        title: Text('Google Sheets'),
        enabled: true,
        leading: CircleAvatar(
            backgroundImage:
                Image.asset('assets/image/google_sheets_logo.png').image,
            backgroundColor: Colors.grey),
        onTap: () async => await launchInBrowser(
            'https://docs.google.com/spreadsheets/d/1PhJym2A_EguDHx04apuljvPxP8fFKu1vR516Cl2Bzms/edit?usp=sharing'),
        subtitle: Text('Planilha de armazenamento de dados do quiz')),
    ListTile(
        title: Text('Toda Matéria'),
        enabled: true,
        leading: CircleAvatar(
            backgroundImage:
                Image.asset('assets/image/toda_materia_logo.png').image),
        onTap: () async => await launchInBrowser(
            'https://www.todamateria.com.br/perguntas-e-respostas-de-conhecimentos-gerais/'),
        subtitle: Text('Fonte de dados do quiz')),
  ];

  static Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
