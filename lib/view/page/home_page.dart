import 'package:ce_tenta_quizz/view/page/quiz_page.dart';
import 'package:ce_tenta_quizz/view/widget/custom_menu_item_card.dart';
import 'package:ce_tenta_quizz/view/widget/custom_text_card.dart';
import 'package:ce_tenta_quizz/view/widget/home_functions.dart';
import 'package:ce_tenta_quizz/view/widget/menu_grid_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeFunc {
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
              IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => shareApp('text', 'subject'))
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
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 40,
                      ),
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            child: MenuGridItemCard(
                                Icons.stars, Colors.yellow, 'Pontuação', [
                              CustomTextSize('Acertos 30', labelInfo),
                              CustomTextSize('Erros 70', labelInfo),
                              CustomTextSize('Equivalem a 50%', labelInfo)
                            ]),
                          ),
                        ],
                      ),
                    )
                  ])),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: MenuItemCard(Icons.info, Colors.blue, () {
                        alertModal(context, 'Curiosidades do App',
                            content: [Text('bla bla')]);
                      }, 'Informações', [
                        CustomTextSize('Site base das perguntas', labelInfo)
                      ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: MenuItemCard(Icons.cloud_circle, Colors.purple,
                          () {
                        alertModal(context, 'Links da Web', content: infoApp);
                      }, 'Sites', [
                        CustomTextSize(
                            'Acesso aos fontes base do projeto', labelInfo)
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
