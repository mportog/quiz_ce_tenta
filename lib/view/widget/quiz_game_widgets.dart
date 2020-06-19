import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../shared/enum/enum_teddy_animations.dart';
import 'custom_question_card.dart';
import 'option_card.dart';
import 'smart_flare_animation.dart';

class QuizPageWidgets extends StatelessWidget {
  QuizPageWidgets(this._questionsStore, this._teddyStore);
  final _questionsStore;
  final _teddyStore;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(alignment: Alignment.topCenter, child: SmartFlareAnimation()),
        QuestionCard(
          Observer(
              builder: (_) => AutoSizeText(
                    _questionsStore
                        .questions[_questionsStore.questionNumber].question,
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
              _questionsStore.questions[_questionsStore.questionNumber].a,
              () => _teddyStore.setTeddyAnimation(TeddyAnimations.fail)),
        ),
        SizedBox(height: 5),
        Observer(
            builder: (_) => OptionCard(
                'B',
                _questionsStore.questions[_questionsStore.questionNumber].b,
                () => _teddyStore.setTeddyAnimation(TeddyAnimations.success))),
        SizedBox(height: 5),
        Observer(
            builder: (_) => OptionCard('C',
                    _questionsStore.questions[_questionsStore.questionNumber].c,
                    () {
                  _teddyStore.setTeddyAnimation(TeddyAnimations.hands_up);
                })),
        SizedBox(height: 5),
        Observer(
            builder: (_) => OptionCard(
                'D',
                _questionsStore.questions[_questionsStore.questionNumber].d,
                () =>
                    _teddyStore.setTeddyAnimation(TeddyAnimations.hands_down))),
      ],
    );
  }
}
