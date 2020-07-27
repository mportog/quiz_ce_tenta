import 'package:ce_tenta_quizz/view/page/quiz_page.dart';
import 'package:ce_tenta_quizz/view/widget/custom_menu_item_card.dart';
import 'package:ce_tenta_quizz/view/widget/custom_text_card.dart';
import 'package:ce_tenta_quizz/view/widget/home_functions.dart';
import 'package:ce_tenta_quizz/view/widget/menu_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../controller/questions_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with WidgetsBindingObserver, HomeFunc {
  final TextStyle labelInfo = TextStyle(fontSize: 20);
  final TextStyle labelLink = TextStyle(
      fontSize: 20,
      color: Colors.blue,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline);
  QuestionsStore _questionsStore;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _questionsStore.getData();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _questionsStore.saveData();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _questionsStore = Provider.of<QuestionsStore>(context);
    _questionsStore.setCurrentQuestion(_questionsStore.questionNumber);
    _questionsStore.getData();
    _questionsStore.fetchQuestions();
    super.didChangeDependencies();
  }

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
                  onPressed: () => shareApp(
                      'Veja só este app de quiz que encontrei! Você pode fazer o download do .apk dele e instalar no seu Android também! http://encurtador.com.br/gnBHR',
                      'Link do app 70Quiz para instalação em Android'))
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
                              Observer(
                                builder: (_) => CustomTextSize(
                                    'Acertos ${_questionsStore.corrects}',
                                    labelInfo),
                              ),
                              Observer(
                                builder: (_) => CustomTextSize(
                                    'Erros ${_questionsStore.wrongs}',
                                    labelInfo),
                              ),
                              Observer(
                                builder: (_) => CustomTextSize(
                                    'Progresso: ${_questionsStore.wrongs + _questionsStore.corrects} de ${_questionsStore.questions.length}',
                                    labelInfo),
                              ),
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
                        alertModal(context, 'Curiosidades', content: [
                          Text(
                              'Aplicativo de entreternimento feito em Flutter com base de dados das perguntas feito no Google Sheets')
                        ]);
                      }, 'Informações',
                          [CustomTextSize('Infos e diferenciais', labelInfo)]),
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
