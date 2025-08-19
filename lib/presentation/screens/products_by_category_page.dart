// Project imports:
import 'package:api_app/data/models/category_item_model.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/categories_page_custom_widgets/custom_sliver_app_bar.dart';
import '../widgets/custom_widgets/products_by_category_list.dart';
import '../widgets/custom_widgets/shimmer_list.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.category});

  final CategoryItem category;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getProductsByCategory(widget.category.categoryName);
  }

  final TextEditingController controller = TextEditingController();

  final bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            categoryTitle: widget.category.categoryTitle,
            controller: controller,
            onChanged: (value) {
              BlocProvider.of<ProductsCubit>(context).searchForProduct(
                  value, value.isEmpty, widget.category.categoryName);
            },
            isClicked: isClicked,
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                final products = state.products;
                return ProductsGrid(
                  products: products,
                  itemCount: products.length,
                );
              } else {
                return const ShimmerList(cardsCount: 8);
              }
            },
          ),
        ],
      ),
    );
  }
}
