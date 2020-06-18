import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:ce_tenta_quizz/shared/enum/enum_teddy_animations.dart';
import 'package:ce_tenta_quizz/view/widget/option_card.dart';
import 'package:ce_tenta_quizz/view/widget/smart_flare_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _teddyStore = Provider.of<TeddyStore>(context);
  }

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
          title: Text('Pergunta 1'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.lightbulb_outline, color: Colors.yellow),
                onPressed: () {
                  print('dica');
                }),
            IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  print('pular');
                })
          ],
        ),
        backgroundColor: Colors.purple,
        body: Stack(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: SmartFlareAnimation()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Center(child: Text('PERGUNTA'))),
                  ),
                ),
                SizedBox(height: 5),
                OptionCard('A', 'ahusuahsuahijsdusa',
                    () => _teddyStore.setTeddyAnimation(TeddyAnimations.fail)),
                SizedBox(height: 5),
                OptionCard(
                    'B',
                    'ahusuahsuahijsdusa',
                    () =>
                        _teddyStore.setTeddyAnimation(TeddyAnimations.success)),
                SizedBox(height: 5),
                OptionCard('C', 'ahusuahsuahijsdusa', () {
                  _teddyStore.setTeddyAnimation(TeddyAnimations.hands_up);
                }),
                SizedBox(height: 5),
                OptionCard(
                    'D',
                    'ahusuahsuahijsdusa',
                    () => _teddyStore
                        .setTeddyAnimation(TeddyAnimations.hands_down)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
