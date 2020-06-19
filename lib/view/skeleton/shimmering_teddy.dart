import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringTeddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/image/freeze_teddy.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ))));
  }
}
