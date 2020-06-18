import 'package:ce_tenta_quizz/view/page/quiz_page.dart';
import 'package:ce_tenta_quizz/view/widget/custom_menu_item_card.dart';
import 'package:ce_tenta_quizz/view/widget/custom_text_card.dart';
import 'package:ce_tenta_quizz/view/widget/menu_grid_card.dart';
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
          body: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              MenuItemCard(Icons.play_circle_filled, Colors.green, () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => QuizPage()));
              }, 'Jogar !', [
                CustomTextSize(
                    'Aperte o icone para dar inicio ao quiz', labelInfo),
                CustomTextSize(
                    '70 perguntas de conhecimentos gerais', labelInfo)
              ]),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width * 0.7,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: MenuGridItemCard(
                          Icons.stars, Colors.yellow, 'Pontuação', [
                        CustomTextSize('Acertos 30', labelInfo),
                        CustomTextSize('Erros 70', labelInfo),
                        CustomTextSize('Equivalem a 50%', labelInfo)
                      ]),
                    )
                  ])),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: MenuItemCard(
                          //  MenuGridItemCard(
                          Icons.info,
                          Colors.blue,
                          () {},
                          'Informações',
                          [
                            CustomTextSize('Site base das perguntas', labelInfo)
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: MenuItemCard(
                          // MenuGridItemCard(
                          Icons.cloud_circle,
                          Colors.purple,
                          () {},
                          'Sites',
                          [
                            CustomTextSize('Site base das perguntas', labelLink)
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          )
          // ListView(children: <Widget>[
          //   MenuItemCard(Icons.play_circle_filled, Colors.green, () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (_) => QuizPage()));
          //   }, 'Jogar !', [
          //     Text('Aperte o icone para dar inicio ao quiz', style: labelInfo),
          //     Text('70 perguntas de conhecimentos gerais', style: labelInfo)
          //   ]),
          //   MenuItemCard(Icons.stars, Colors.yellow, () {}, 'Pontuação', [
          //     Text('Acertos 30', style: labelInfo),
          //     Text('Erros 70', style: labelInfo),
          //     Text('Equivalem a 50%', style: labelInfo)
          //   ]),
          //   MenuItemCard(Icons.info, Colors.blue, () {}, 'Informações',
          //       [Text('Site base das perguntas', style: labelInfo)]),
          //   MenuItemCard(Icons.cloud_circle, Colors.purple, () {}, 'Sites',
          //       [Text('Site base das perguntas', style: labelLink)]),
          // ]),

          ),
    );
  }
}
