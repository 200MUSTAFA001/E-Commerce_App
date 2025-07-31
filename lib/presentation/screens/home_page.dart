import 'package:api_app/app_router.dart';
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:api_app/presentation/widgets/lists/products_by_category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cards/welcome_user_tile.dart';
import '../widgets/category_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/lists/sale_cards_list.dart';
import '../widgets/lists/shimmer_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "mens-shirts";

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getProductsByCategory(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      // backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.cartPage);
                },
                icon: const Icon(CupertinoIcons.search),
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
                        child: const Text("See All"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryBar(
                  onCategorySelected: (String category) {
                    selectedCategory = category;
                    BlocProvider.of<ProductsCubit>(context)
                        .getProductsByCategory(category);
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ).onlyPadding(right: 16, left: 16, top: 20, bottom: 10),
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                products = state.products;
                return ProductsByCategoryList(
                  itemCount: 4,
                  products: products,
                );
              } else {
                return const ShimmerList(
                  cardsCount: 4,
                );
              }
            },
          ),
          SliverToBoxAdapter(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.productsByCategoryPage,
                    arguments: selectedCategory);
              },
              child: const Text(
                "Show More",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ).onlyPadding(right: 0, left: 0, top: 8, bottom: 16),
          ),
        ],
      ),
    );
  }
}
