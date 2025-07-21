import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleCardData {
  final List<String> cardCategories;
  final String cardName;
  final String cardImage;
  final Color buttonColor;
  final Color cardNameColor;

  SaleCardData({
    required this.cardCategories,
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
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 20, left: 10),
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
            Text(
              cardName,
              style: GoogleFonts.oswald(
                  fontSize: 22, color: cardNameColor, letterSpacing: 1),
              maxLines: 2,
            ).onlyPadding(right: 100, left: 10, top: 0, bottom: 0),
            ElevatedButton(
              onPressed: elevatedButtonOnPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: const Text(
                "Get Now",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
