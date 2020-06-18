import 'package:ce_tenta_quizz/view/page/quiz_page.dart';
import 'package:ce_tenta_quizz/view/widget/custom_menu_item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle labelInfo = TextStyle(fontSize: 20);
  final TextStyle labelLink = TextStyle(
      fontSize: 20,
      color: Colors.blue,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('70 Quiz', style: TextStyle(fontSize: 28)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: () {})
          ],
        ),
        backgroundColor: Colors.purple,
        body: ListView(children: <Widget>[
          MenuItemCard(Icons.play_circle_filled, Colors.green, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => QuizPage()));
          }, 'Jogar !', [
            Text('Aperte o icone para dar inicio ao quiz', style: labelInfo),
            Text('70 perguntas de conhecimentos gerais', style: labelInfo)
          ]),
          MenuItemCard(Icons.stars, Colors.yellow, () {}, 'Pontuação', [
            Text('Acertos 30', style: labelInfo),
            Text('Erros 70', style: labelInfo),
            Text('Equivalem a 50%', style: labelInfo)
          ]),
          MenuItemCard(Icons.info, Colors.blue, () {}, 'Informações',
              [Text('Site base das perguntas', style: labelInfo)]),
          MenuItemCard(Icons.cloud_circle, Colors.purple, () {}, 'Sites',
              [Text('Site base das perguntas', style: labelLink)]),
        ]),
      ),
    );
  }
}
