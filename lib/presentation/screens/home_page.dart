import 'package:api_app/app_router.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cards/welcome_user_tile.dart';
import '../widgets/custom_widgets/category_bar.dart';
import '../widgets/custom_widgets/custom_drawer.dart';
import '../widgets/lists/products_list.dart';
import '../widgets/lists/recommended_products_list.dart';
import '../widgets/lists/sale_cards_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "mens-shirts";
  String recommendedListCategory = "mens-watches";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getProductsByCategory(selectedCategory, recommendedListCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        .getProductsByCategory(
                            category, recommendedListCategory);
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
            ).onlyPadding(right: 120, left: 120, top: 14, bottom: 24),
          ),
          SliverToBoxAdapter(
            child: Image.asset("assets/cardpics/bagsCard.jpg")
                .allPadding(padding: 8),
          ),
          const RecommendedProductsList(),
        ],
      ),
    );
  }
}
