import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: context.height * 0.1,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // title: const Text(
            //   "Home",
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            // ),
            actions: [
              Hero(
                tag: "searchBarTag",
                child: SizedBox(
                  width: context.width * 0.9,
                  height: context.height * 0.07,
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRouter.searchPage);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade300),
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black45,
                        size: 28,
                      ),
                    ),
                  ),
                ),
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
                        context.push(AppRouter.allCategoriesPage);
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
                  context.push(
                    AppRouter.productsByCategoryPage,
                    extra: selectedCategory,
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
            ).onlyPadding(left: 10, bottom: 24),
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
              height: context.height * 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
