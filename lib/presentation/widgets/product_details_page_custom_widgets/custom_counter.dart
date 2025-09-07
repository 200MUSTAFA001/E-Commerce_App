// Flutter imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:e_commerce_app/extensions.dart';

class CustomCounter extends StatefulWidget {
  CustomCounter({
    super.key,
    required this.quantity,
    required this.productQuantity,
  });

  int productQuantity = 1;

  final void Function(int productQuantity) quantity;

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.05,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 10,
        children: [
          IconButton(
            style:
                IconButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
            onPressed: () {
              setState(() {
                widget.productQuantity > 1
                    ? widget.productQuantity--
                    : widget.productQuantity = 1;
                widget.quantity(widget.productQuantity);
              });
            },
            icon: const Icon(
              CupertinoIcons.minus,
              color: Colors.white,
            ),
          ),
          Text(
            "${widget.productQuantity}",
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            style:
                IconButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
            onPressed: () {
              setState(() {
                widget.productQuantity < 20
                    ? widget.productQuantity++
                    : widget.productQuantity = 20;
                widget.quantity(widget.productQuantity);
              });
            },
            icon: const Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
