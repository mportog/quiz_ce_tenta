import 'package:ce_tenta_quizz/view/widget/smart_flare_animation.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: ListView(children: <Widget>[
          Align(alignment: Alignment.topCenter, child: SmartFlareAnimation()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(child: Text('PERGUNTA')),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: () {}, child: Text('A')),
            RaisedButton(onPressed: () {}, child: Text('B')),
            RaisedButton(onPressed: () {}, child: Text('C')),
            RaisedButton(onPressed: () {}, child: Text('D')),
          ],
        ),
      ),
    );
  }
}
