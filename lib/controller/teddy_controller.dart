import 'package:ce_tenta_quizz/shared/enum/enum_teddy_animations.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:mobx/mobx.dart';

import '../shared/enum/enum_teddy_animations.dart';
part 'teddy_controller.g.dart';

class TeddyStore = _TeddyStoreBase with _$TeddyStore;

abstract class _TeddyStoreBase with Store {
  @observable
  FlareControls teddyControl = FlareControls();

  TeddyAnimations lastAnimation = TeddyAnimations.idle;

  @action
  String _getAnimationName(TeddyAnimations anim) {
    switch (anim) {
      case TeddyAnimations.idle:
        return 'idle';
      case TeddyAnimations.success:
        return 'success';
      case TeddyAnimations.fail:
        return 'fail';
      case TeddyAnimations.hands_up:
        return 'hands_up';
      case TeddyAnimations.hands_down:
        return 'hands_down';
        break;
      default:
        return 'idle';
    }
  }

  @action
  void setTeddyAnimation(TeddyAnimations animation) {
    if (lastAnimation == TeddyAnimations.hands_up) {
      var anim = _getAnimationName(TeddyAnimations.hands_down);
      teddyControl.play(anim);
    }

    Future.delayed(Duration(milliseconds: 800));

    var anim = _getAnimationName(animation);
    teddyControl.play(anim);
    lastAnimation = animation;
  }
}
