import 'package:ce_tenta_quizz/controller/questions_controller.dart';
import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:ce_tenta_quizz/view/skeleton/quiz_page_skeleton.dart';
import 'package:ce_tenta_quizz/view/widget/quiz_game_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _questionsStore = Provider.of<QuestionsStore>(context);
    _teddyStore = Provider.of<TeddyStore>(context);
  }

  QuestionsStore _questionsStore;
  TeddyStore _teddyStore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0,
          title: Observer(
            builder: (_) => Text(
                'Pergunta ${_questionsStore.questionNumber + 1} de ${_questionsStore.questions.length}'),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.lightbulb_outline, color: Colors.yellow),
                onPressed: () {
                  print('dica');
                })
          ],
        ),
        backgroundColor: Colors.purple,
        body: Stack(children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 10),
            child: FutureBuilder(
                future: _questionsStore.fetchQuestions(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return QuizPageSkeleton();
                    case ConnectionState.waiting:
                      return Container(
                          child: Center(child: Text('Sem Internet!')));
                    default:
                      if (snapshot.hasError || snapshot.data == null)
                        return Container(child: Center(child: Text('ERRO!')));
                      else
                        return QuizPageWidgets(_questionsStore, _teddyStore);
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
