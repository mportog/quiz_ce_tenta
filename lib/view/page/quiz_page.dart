import 'package:auto_size_text/auto_size_text.dart';
import 'package:ce_tenta_quizz/controller/questions_controller.dart';
import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:ce_tenta_quizz/shared/enum/enum_teddy_animations.dart';
import 'package:ce_tenta_quizz/view/skeleton/quiz_page_skeleton.dart';
import 'package:ce_tenta_quizz/view/widget/custom_question_card.dart';
import 'package:ce_tenta_quizz/view/widget/option_card.dart';
import 'package:ce_tenta_quizz/view/widget/smart_flare_animation.dart';
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
    _questionsStore.fetchQuestions();
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
              child: Observer(
                builder: (_) => !_questionsStore.isLoading
                    ? Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topCenter,
                              child: SmartFlareAnimation()),
                          QuestionCard(
                            Observer(
                                builder: (_) => AutoSizeText(
                                      _questionsStore
                                          .questions[
                                              _questionsStore.questionNumber]
                                          .question,
                                      style: TextStyle(fontSize: 40),
                                      textAlign: TextAlign.center,
                                      minFontSize: 10,
                                      stepGranularity: 2,
                                      maxLines: 8,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                          ),
                          SizedBox(height: 5),
                          Observer(
                            builder: (_) => OptionCard(
                                'A',
                                _questionsStore
                                    .questions[_questionsStore.questionNumber]
                                    .a,
                                () => _teddyStore
                                    .setTeddyAnimation(TeddyAnimations.fail)),
                          ),
                          SizedBox(height: 5),
                          Observer(
                              builder: (_) => OptionCard(
                                  'B',
                                  _questionsStore
                                      .questions[_questionsStore.questionNumber]
                                      .b,
                                  () => _teddyStore.setTeddyAnimation(
                                      TeddyAnimations.success))),
                          SizedBox(height: 5),
                          Observer(
                              builder: (_) => OptionCard(
                                      'C',
                                      _questionsStore
                                          .questions[
                                              _questionsStore.questionNumber]
                                          .c, () {
                                    _teddyStore.setTeddyAnimation(
                                        TeddyAnimations.hands_up);
                                  })),
                          SizedBox(height: 5),
                          Observer(
                              builder: (_) => OptionCard(
                                  'D',
                                  _questionsStore
                                      .questions[_questionsStore.questionNumber]
                                      .d,
                                  () => _teddyStore.setTeddyAnimation(
                                      TeddyAnimations.hands_down))),
                        ],
                      )
                    : QuizPageSkeleton(),
              )),
        ]),
      ),
    );
  }
}
