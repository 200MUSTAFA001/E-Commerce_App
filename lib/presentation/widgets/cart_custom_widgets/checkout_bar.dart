import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'checkout_bar_scroll_down.dart';
import 'checkout_bar_scroll_up.dart';

class CheckoutBar extends StatefulWidget {
  const CheckoutBar({super.key, required this.controller});

  final ScrollController controller;

  @override
  State<CheckoutBar> createState() => _CheckoutBarState();
}

class _CheckoutBarState extends State<CheckoutBar> {
  bool isScrollAbove = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      final direction = widget.controller.position.userScrollDirection;

      if (direction == ScrollDirection.forward) {
        setState(() {
          isScrollAbove = true;
        });
      } else if (direction == ScrollDirection.reverse) {
        setState(() {
          isScrollAbove = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isScrollAbove
        ? const CheckoutBarScrollUp()
        : const CheckoutBarScrollDown();
  }
}
