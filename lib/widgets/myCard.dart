import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double heigth;
  final double borderRadius;
  final Widget child;

  MyCard({@required this.borderRadius, @required this.heigth, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: this.heigth,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.borderRadius),
          ),
          elevation: 10,
          child: this.child,
        ),
      ),
    );
  }
}
