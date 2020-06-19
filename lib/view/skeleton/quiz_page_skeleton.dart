import 'package:auto_size_text/auto_size_text.dart';
import 'package:ce_tenta_quizz/view/skeleton/shimmering_list_tile.dart';
import 'package:ce_tenta_quizz/view/skeleton/shimmering_teddy.dart';
import 'package:ce_tenta_quizz/view/widget/custom_question_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuizPageSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ShimmeringTeddy(),
          QuestionCard(
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: AutoSizeText(
                'Carregando ...',
                maxFontSize: 40,
                minFontSize: 20,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5),
          ShimmeringListTile(),
          SizedBox(height: 5),
          ShimmeringListTile(),
          SizedBox(height: 5),
          ShimmeringListTile(),
          SizedBox(height: 5),
          ShimmeringListTile(),
        ],
      ),
    );
  }
}
