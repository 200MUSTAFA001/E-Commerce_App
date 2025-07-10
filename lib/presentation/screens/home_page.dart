import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/limited_products_cubit.dart';
import 'package:api_app/presentation/widgets/lists/products_by_category_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/category_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/lists/sales_card_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "mens-shirts";

  List<Product>? products;

  @override
  void initState() {
    super.initState();
    products = BlocProvider.of<LimitedProductsCubit>(context)
        .getLimitedProducts(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
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
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                "Hello Mustafa",
                style: GoogleFonts.fjallaOne(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                "Let's start Shopping!",
                style: GoogleFonts.shareTech(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ).onlyPadding(right: 0, left: 0, top: 0, bottom: 6),
          ),
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
                    TextButton(onPressed: () {}, child: const Text("See All"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryBar(
                  onCategorySelected: (String category) {
                    selectedCategory = category;
                    products = BlocProvider.of<LimitedProductsCubit>(context)
                        .getLimitedProducts(category);
                  },
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ).onlyPadding(right: 16, left: 16, top: 20, bottom: 10),
          ),
          BlocBuilder<LimitedProductsCubit, LimitedProductsState>(
            builder: (context, state) {
              if (state is LimitedProductsLoaded) {
                products = state.products;
                return ProductsByCategoryGrid(
                  products: products ?? [],
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

extension OnlyPaddingRL on Widget {
  Widget onlyPadding(
      {required double right,
      required double left,
      required double top,
      required double bottom}) {
    return Padding(
        padding:
            EdgeInsets.only(right: right, left: left, top: top, bottom: bottom),
        child: this);
  }
}
