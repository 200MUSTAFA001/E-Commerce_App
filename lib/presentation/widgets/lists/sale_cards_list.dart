import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cards/sales_card.dart';

class SaleCardsList extends StatelessWidget {
  SaleCardsList({super.key});

  final List<SaleCardData> saleCards = [
    SaleCardData(
      cardCategories: [
        "laptops",
        "mobile-accessories",
        "smartphones",
        "tablets"
      ],
      cardName: "Electronics Sale - Up to 40% Off",
      cardImage: "assets/cardpics/gaming1.png",
      buttonColor: Colors.green.shade700,
      cardNameColor: Colors.white,
    ),
    SaleCardData(
      cardCategories: ["kitchen-accessories"],
      cardName: "kitchenware Sale - Up to 50% Off",
      cardImage: "assets/cardpics/appliances.png",
      buttonColor: Colors.deepOrange.shade900,
      cardNameColor: Colors.white,
    ),
    SaleCardData(
      cardCategories: [
        "mens-shirts",
        "mens-shoes",
        "sunglasses",
        "womens-bags",
        "womens-dresses",
        "womens-jewellery",
        "womens-shoes"
      ],
      cardName: "Fashion Sale - Up to 50% Off",
      cardImage: "assets/cardpics/fashion.jpg",
      buttonColor: Colors.orange.shade700,
      cardNameColor: Colors.blue.shade900,
    ),
    SaleCardData(
      cardCategories: ["furniture", "home-decoration"],
      cardName: "Furniture Sale - Up to 30% Off",
      cardImage: "assets/cardpics/furniture2.png",
      buttonColor: Colors.blue.shade900,
      cardNameColor: Colors.white,
    ),
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: PageView.builder(
              controller: pageController,
              itemCount: saleCards.length,
              itemBuilder: (context, index) => SaleCard(
                cardName: saleCards[index].cardName,
                cardImage: saleCards[index].cardImage,
                buttonColor: saleCards[index].buttonColor,
                cardNameColor: saleCards[index].cardNameColor,
                onTap: () {
                  final arguments = saleCards[index].cardCategories;
                  context.push(AppRouter.productsOnSalePage, extra: arguments);
                },
                elevatedButtonOnPressed: () {
                  final arguments = saleCards[index].cardCategories;
                  context.push(AppRouter.productsOnSalePage, extra: arguments);
                },
              ),
            ),
          ).onlyPadding(right: 0, left: 0, top: 16, bottom: 0),
          SmoothPageIndicator(
            controller: pageController,
            count: saleCards.length,
            onDotClicked: (value) {
              pageController.jumpToPage(value);
            },
            effect: const ScaleEffect(
              dotWidth: 14,
              dotHeight: 14,
              activeDotColor: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
    );
  }
}

// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: saleCards.length,
//   itemBuilder: (context, index) => SaleCard(
//     elevatedButtonOnPressed: () {
//       final arguments = saleCards[index].cardCategories;
//       Navigator.pushNamed(context, AppRouter.productsOnSalePage,
//           arguments: arguments);
//     },
//     onTap: () {
//       final arguments = saleCards[index].cardCategories;
//       Navigator.pushNamed(context, AppRouter.productsOnSalePage,
//           arguments: arguments);
//     },
//     cardName: saleCards[index].cardName,
//     cardImage: saleCards[index].cardImage,
//     buttonColor: saleCards[index].buttonColor,
//     cardNameColor: saleCards[index].cardNameColor,
//   ),
// ),
