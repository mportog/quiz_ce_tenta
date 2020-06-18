import 'package:ce_tenta_quizz/controller/teddy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _teddyStore = Provider.of<TeddyStore>(context);
  }

  TeddyStore _teddyStore;

  @override
  Widget build(BuildContext context) {
    double animationWidth = MediaQuery.of(context).size.width;
    double animationHeight = MediaQuery.of(context).size.width / 2;

    return Container(
        width: animationWidth,
        height: animationHeight,
        child: Observer(
          builder: (_) => FlareActor('assets/flare/Teddy.flr',
              animation: 'idle', controller: _teddyStore.teddyControl),
        ));
  }
}
