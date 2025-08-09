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

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
}
