import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cards/welcome_user_tile.dart';
import '../widgets/custom_widgets/category_bar.dart';
import '../widgets/custom_widgets/custom_drawer.dart';
import '../widgets/custom_widgets/offer_banner.dart';
import '../widgets/lists/products_list.dart';
import '../widgets/lists/recommended_products_list.dart';
import '../widgets/lists/sale_cards_list.dart';
import '../widgets/lists/sublist_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "mens-shirts";
  final String recommendedListCategory = "sunglasses";
  final String subListCategory = "mens-shoes";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getSeveralListForHomePage(
      selectedCategory,
      recommendedListCategory,
      subListCategory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo : bottomNavigationBar
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRouter.cartPage);
                  Navigator.pushNamed(context, AppRouter.favoritesPage);
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const WelcomeUserTile(),
          SaleCardsList(),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRouter.allCategoriesPage);
                      },
                      child: const Text("See All"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryBar(
                  onCategorySelected: (String category) {
                    selectedCategory = category;
                    BlocProvider.of<ProductsCubit>(context)
                        .getSeveralListForHomePage(
                            category, recommendedListCategory, subListCategory);
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ).onlyPadding(right: 16, left: 16, top: 20, bottom: 10),
          ),
          const ProductsList(),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRouter.productsByCategoryPage,
                    arguments: selectedCategory,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Text(
                  "Show More",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ).onlyPadding(right: 0, left: 10, top: 0, bottom: 24),
          ),
          const RecommendedProductsList(),
          const OfferBanner(
            bannerImage: "assets/cardpics/bagsCard.jpg",
            category: "womens-bags",
          ),
          const SublistProducts(),
          const OfferBanner(
            bannerImage: "assets/cardpics/watchsCard.jpg",
            category: "mens-watches",
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.screenHeight * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
