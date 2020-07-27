import 'package:ce_tenta_quizz/controller/questions_controller.dart';
import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:ce_tenta_quizz/view/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<TeddyStore>(create: (_) => TeddyStore()),
          Provider<QuestionsStore>(create: (_) => QuestionsStore()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '70 Quiz',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ));
  }
}
