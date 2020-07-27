import 'package:ce_tenta_quizz/controller/questions_controller.dart';
import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:ce_tenta_quizz/view/widget/custom_bottom_sheet.dart';
import 'package:ce_tenta_quizz/view/widget/custom_index_icon.dart';
import 'package:ce_tenta_quizz/view/widget/quiz_game_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../shared/enum/enum_teddy_animations.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _questionsStore = Provider.of<QuestionsStore>(context);
    _questionsStore.isLoading = true;
    _teddyStore = Provider.of<TeddyStore>(context);
    reaction(
        (_) => _questionsStore.message.isNotEmpty,
        (_) => CustomBottomeSheet().customBottomSheet(
            context, 'Curiosidade', Text(_questionsStore.message)));
    Future.delayed(Duration(seconds: 1))
        .then((value) => _questionsStore.isLoading = false);
  }

  TeddyStore _teddyStore;
  QuestionsStore _questionsStore;

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
            FlatButton.icon(
                onPressed: () {
                  _questionsStore.useHint();
                  _teddyStore.setTeddyAnimation(TeddyAnimations.hands_up);
                },
                icon: Text('Dicas'),
                label: Observer(
                  builder: (_) => CustomNotificationIndex(
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.yellow,
                      ),
                      _questionsStore.hints.toString()),
                ),
                textColor: Colors.white)
          ],
        ),
        backgroundColor: Colors.purple,
        body: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 10),
          child: Observer(
              builder: (_) => QuizPageWidgets(
                  _questionsStore.questions[_questionsStore.questionNumber],
                  _questionsStore.selected,
                  _teddyStore)),
        ),
      ),
    );
  }
}
