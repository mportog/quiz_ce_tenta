import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../controller/teddy_controller.dart';
import '../../model/questions_response.dart';
import '../../shared/enum/enum_teddy_animations.dart';
import 'custom_question_card.dart';
import 'option_card.dart';
import 'smart_flare_animation.dart';

class QuizPageWidgets extends StatelessWidget {
  QuizPageWidgets(this.questionData, this.selectOpt, this._teddyStore);
  final Questions questionData;
  final TeddyStore _teddyStore;
  bool selectOpt;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Align(alignment: Alignment.topCenter, child: SmartFlareAnimation()),
          QuestionCard(AutoSizeText(
            questionData.question,
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
            minFontSize: 10,
            stepGranularity: 2,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(height: 5),
          OptionCard('A', questionData.a, () {
            selectOpt = 'a' == questionData.correct;
            _teddyStore.setTeddyAnimation('a' == questionData.correct
                ? TeddyAnimations.success
                : TeddyAnimations.fail);
          }),
          SizedBox(height: 5),
          OptionCard('B', questionData.b, () {
            selectOpt = 'b' == questionData.correct;
            _teddyStore.setTeddyAnimation('b' == questionData.correct
                ? TeddyAnimations.success
                : TeddyAnimations.fail);
          }),
          SizedBox(height: 5),
          OptionCard('C', questionData.c, () {
            selectOpt = 'c' == questionData.correct;
            _teddyStore.setTeddyAnimation('c' == questionData.correct
                ? TeddyAnimations.success
                : TeddyAnimations.fail);
          }),
          SizedBox(height: 5),
          OptionCard('D', questionData.d, () {
            selectOpt = 'd' == questionData.correct;
            _teddyStore.setTeddyAnimation('d' == questionData.correct
                ? TeddyAnimations.success
                : TeddyAnimations.fail);
          }),
          SizedBox(height: 5),
          OptionCard('E', questionData.e, () {
            selectOpt = 'e' == questionData.correct;
            _teddyStore.setTeddyAnimation('e' == questionData.correct
                ? TeddyAnimations.success
                : TeddyAnimations.fail);
          }),
        ],
      ),
    );
  }
}
