// Flutter imports:
// Project imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/products_cubit.dart';
import '../widgets/custom_widgets/products_by_category_list.dart';
import '../widgets/custom_widgets/shimmer_list.dart';

class ProductsOnSalePage extends StatefulWidget {
  const ProductsOnSalePage({super.key, required this.categories});

  final List<String> categories;

  @override
  State<ProductsOnSalePage> createState() => _ProductsOnSalePageState();
}

class _ProductsOnSalePageState extends State<ProductsOnSalePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .getProductsBySeveralCategories(widget.categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            final products = state.products;
            return CustomScrollView(
              slivers: [
                const SliverAppBar(elevation: 0),
                ProductsGrid(
                  products: products,
                  itemCount: products.length,
                ),
              ],
            ).onlyPadding(right: 2);
          } else if (state is ProductsLoading) {
            return const Center(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(),
                  ShimmerList(cardsCount: 8),
                ],
              ),
            );
          } else {
            return const Center(
                child: Icon(
              Icons.error_outline,
              size: 200,
            ));
          }
        },
      ),
    );
  }
}
/*
class SD extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..blendMode = BlendMode.clear;
    final path = Path();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
*/
