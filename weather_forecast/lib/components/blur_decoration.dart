import 'dart:ffi';

import 'package:flutter/material.dart';

class BlurDecoration extends StatelessWidget {
  final double position;
  final double height;
  final double top;
  final double width;
  final Color color;

  BlurDecoration(
      {required this.position,
      required this.height,
      required this.top,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(position, top),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
