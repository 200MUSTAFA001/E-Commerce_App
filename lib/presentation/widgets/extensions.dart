import 'package:flutter/material.dart';

extension OnlyPaddingRL on Widget {
  Widget onlyPadding({
    required double right,
    required double left,
    required double top,
    required double bottom,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(right: right, left: left, top: top, bottom: bottom),
      child: this,
    );
  }
}
