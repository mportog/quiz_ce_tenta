import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        enabled: false,
        leading: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: CircleAvatar()),
        title: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.70,
              color: Colors.green,
              height: 10,
            )),
        subtitle: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.70,
              color: Colors.grey,
              height: 10,
            )),
      ),
    );
  }
}
