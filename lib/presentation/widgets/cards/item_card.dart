import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemName,
    required this.itemImage,
  });

  final String itemName;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(itemImage),
            fit: BoxFit.fill,
          ),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 1,
              spreadRadius: 0,
              offset: Offset(3, 3),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.276,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Text(
              itemName,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                overflow: TextOverflow.fade,
              ),
            ),
          )
        ],
      ),
    );
  }
}
