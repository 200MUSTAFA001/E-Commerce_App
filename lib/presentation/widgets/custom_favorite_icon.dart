import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({super.key, required this.onTap});

  final void Function() onTap;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onTap
      //     () {
      //   setState(() {
      //     isFavorite = !isFavorite;
      //   });
      // }
      ,
      icon: isFavorite
          ? const Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            )
          : const Icon(CupertinoIcons.suit_heart),
      style: IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
    );
  }
}
