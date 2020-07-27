import '../shared/enum/enum_teddy_animations.dart';

class AnswerInfo {
  AnswerInfo(this.anim, this.right, this.message);
  final TeddyAnimations anim;
  final bool right;
  final String message;
}
