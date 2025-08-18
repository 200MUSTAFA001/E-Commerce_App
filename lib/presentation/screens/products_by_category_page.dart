// Flutter imports:
// Project imports:
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_widgets/products_by_category_list.dart';
import '../widgets/custom_widgets/shimmer_list.dart';

class ProductsByCategoryPage extends StatefulWidget {
  const ProductsByCategoryPage({super.key, required this.category});

  final String category;

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getProductsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
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
