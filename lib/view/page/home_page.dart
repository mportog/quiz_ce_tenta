import 'package:ce_tenta_quizz/view/page/quiz_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Container()),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => QuizPage()));
            },
            icon: Icon(Icons.play_circle_outline, color: Colors.purple),
            label: Text('Jogar', style: TextStyle(color: Colors.purple))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
