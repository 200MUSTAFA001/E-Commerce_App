import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/category_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/sales_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SaleCardData> saleCards = [
    SaleCardData(
      cardName: "Fashion Sale - Up to 50% Off",
      cardImage: "assets/cardpics/fashion.jpg",
      buttonColor: Colors.orange.shade700,
      cardNameColor: Colors.blue.shade900,
    ),
    SaleCardData(
      cardName: "Appliances Sale - Up to 50% Off",
      cardImage: "assets/cardpics/appliances.png",
      buttonColor: Colors.deepOrange.shade900,
      cardNameColor: Colors.white,
    ),
    SaleCardData(
      cardName: "Electronics Sale - Up to 40% Off",
      cardImage: "assets/cardpics/gaming1.png",
      buttonColor: Colors.green.shade700,
      cardNameColor: Colors.white,
    ),
    SaleCardData(
      cardName: "Furniture Sale - Up to 30% Off",
      cardImage: "assets/cardpics/furniture2.png",
      buttonColor: Colors.blue.shade900,
      cardNameColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.search),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                "Hello Fola",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Let's start Shopping! "),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: saleCards.length,
                itemBuilder: (context, index) => SaleCard(
                  elevatedButtonOnPressed: () {},
                  onTap: () {},
                  cardName: saleCards[index].cardName,
                  cardImage: saleCards[index].cardImage,
                  buttonColor: saleCards[index].buttonColor,
                  cardNameColor: saleCards[index].cardNameColor,
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 22, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Categories",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {}, child: const Text("See All"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CategoryBar(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          // ProductsByCategoryGrid(
          //   fakeStoreProducts: [
          //     // Product(
          //     //     id: 0,
          //     //     title: "title",
          //     //     image: "image",
          //     //     price: 0,
          //     //     description: "description",
          //     //     brand: "brand",
          //     //     model: "model",
          //     //     color: "color",
          //     //     category: "category")
          //   ],
          //   platziProducts: [
          //     // PlatziProduct(
          //     //     id: 0,
          //     //     title: "titssle",
          //     //     slug: "slug",
          //     //     price: 1,
          //     //     description: "description",
          //     //     category: Category(
          //     //         id: 0,
          //     //         name: "name",
          //     //         slug: "slug",
          //     //         image: "image",
          //     //         creationAt: DateTime(2000),
          //     //         updatedAt: DateTime(2000)),
          //     //     images: [],
          //     //     creationAt: DateTime(2000),
          //     //     updatedAt: DateTime(2000))
          //   ],
          // )
        ],
      ),
    );
  }
}
