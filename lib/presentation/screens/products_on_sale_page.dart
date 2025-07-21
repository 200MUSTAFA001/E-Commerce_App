import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:api_app/presentation/widgets/lists/products_by_category_list.dart';
import 'package:api_app/presentation/widgets/lists/shimmer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/all_products_cubit.dart';

class ProductsOnSalePage extends StatefulWidget {
  ProductsOnSalePage({super.key, required this.categories});

  List<String>? categories;

  @override
  State<ProductsOnSalePage> createState() => _ProductsOnSalePageState();
}

class _ProductsOnSalePageState extends State<ProductsOnSalePage> {
  // late AllProductsCubit cubit;

  @override
  void initState() {
    super.initState();
    // cubit = context.read<AllProductsCubit>();
    // cubit.getProductsBySeveralCategories(widget.categories ?? []);
    BlocProvider.of<AllProductsCubit>(context)
        .getProductsBySeveralCategories(widget.categories ?? []);
  }

  // @override
  // void dispose() {
  //   cubit.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoaded) {
            final products = state.products;
            return CustomScrollView(
              slivers: [
                const SliverAppBar(elevation: 0),
                ProductsByCategoryList(products: products),
              ],
            ).onlyPadding(right: 2, left: 0, top: 0, bottom: 0);
          } else if (state is AllProductsLoading) {
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
//
//
//
// class SD extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..blendMode = BlendMode.clear;
//     final path = Path();
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
