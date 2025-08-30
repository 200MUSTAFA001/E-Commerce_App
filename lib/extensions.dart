// Flutter imports:
import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget onlyPadding({
    double right = 0,
    double left = 0,
    double top = 0,
    double bottom = 0,
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

  Widget allPadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
}
