import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  QuestionCard(this.childWidget);
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: childWidget),
            ),
          ),
        ),
      ),
    );
  }
}
