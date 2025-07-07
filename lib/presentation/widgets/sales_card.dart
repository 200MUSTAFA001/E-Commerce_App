import 'package:flutter/material.dart';

class SaleCardData {
  final String cardName;
  final String cardImage;
  final Color buttonColor;
  final Color cardNameColor;

  SaleCardData({
    required this.cardName,
    required this.cardImage,
    required this.buttonColor,
    required this.cardNameColor,
  });
}

class SaleCard extends StatelessWidget {
  const SaleCard({
    super.key,
    required this.cardName,
    required this.cardImage,
    required this.buttonColor,
    required this.cardNameColor,
    required this.onTap,
    required this.elevatedButtonOnPressed,
  });

  final String cardName;
  final String cardImage;
  final Color buttonColor;
  final Color cardNameColor;
  final VoidCallback onTap;
  final VoidCallback elevatedButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 10, left: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(cardImage),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Text(
                cardName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: cardNameColor,
                ),
                maxLines: 2,
              ),
            ),
            ElevatedButton(
              onPressed: elevatedButtonOnPressed,
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              child: Text(
                "Get Now",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
