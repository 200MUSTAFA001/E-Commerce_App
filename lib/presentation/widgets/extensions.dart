import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget onlyPadding({
    required double right,
    required double left,
    required double top,
    required double bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        right: right,
        left: left,
        top: top,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget allPadding({required double padding}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}
