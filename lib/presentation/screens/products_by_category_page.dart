import 'package:api_app/logic/cubit/all_products_cubit.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:api_app/presentation/widgets/lists/products_by_category_list.dart';
import 'package:api_app/presentation/widgets/lists/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<AllProductsCubit>(context).getAllProducts(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoaded) {
            final products = state.products;
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  elevation: 0,
                ),
                ProductsByCategoryList(products: products),
              ],
            ).onlyPadding(right: 2, left: 0, top: 0, bottom: 0);
          } else {
            return const CustomScrollView(
              slivers: [
                SliverAppBar(),
                ShimmerList(cardsCount: 8),
              ],
            );
          }
        },
      ),
    );
  }
}
