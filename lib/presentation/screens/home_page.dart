// Flutter imports:
// Project imports:
import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/category_item_model.dart';
import '../widgets/custom_widgets/products_list.dart';
import '../widgets/home_page_custom_widgets/category_bar.dart';
import '../widgets/home_page_custom_widgets/custom_drawer.dart';
import '../widgets/home_page_custom_widgets/offer_banner.dart';
import '../widgets/home_page_custom_widgets/recommended_list.dart';
import '../widgets/home_page_custom_widgets/sale_cards_list.dart';
import '../widgets/home_page_custom_widgets/show_more_button.dart';
import '../widgets/home_page_custom_widgets/sublist_list.dart';
import '../widgets/home_page_custom_widgets/welcome_user_tile.dart';

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
      resizeToAvoidBottomInset: false,
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    context.push(AppRouter.userAddressesPage);
                  },
                  icon: Icon(Icons.ac_unit)),
              Hero(
                tag: "searchBarTag",
                child: IconButton(
                  onPressed: () {
                    context.push(AppRouter.searchPage);
                  },
                  icon: const Icon(CupertinoIcons.search, size: 28),
                  tooltip: "search",
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push(AppRouter.cartPage);
                },
                icon: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.deepOrangeAccent,
                  size: 28,
                ),
                tooltip: "cart",
              ),
              const SizedBox(width: 10)
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
                        context.push(AppRouter.categoriesPage);
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CategoryBar(
                  onCategorySelected: (String category) {
                    selectedCategory = category;
                    BlocProvider.of<ProductsCubit>(context)
                        .getSeveralListForHomePage(
                            category, recommendedListCategory, subListCategory);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ).onlyPadding(right: 16, left: 16, top: 20, bottom: 10),
          ),
          const HomePageProductsList(),
          ShowMoreHomePageButton(
            onPressed: () {
              context.push(
                AppRouter.productsByCategoryPage,
                extra: selectedCategory,
              );
            },
          ),
          const RecommendedList(),
          OfferBanner(
            bannerImage: "assets/cardpics/bagsCard.jpg",
            categoryItem: CategoryItem(
              categoryName: "womens-bags",
              categoryImage: "",
              categoryTitle: "Women's bags",
            ),
          ),
          const SublistProducts(),
          OfferBanner(
            bannerImage: "assets/cardpics/watchesCard.jpg",
            categoryItem: CategoryItem(
              categoryName: "mens-watches",
              categoryImage: "",
              categoryTitle: "Watches",
            ),
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
