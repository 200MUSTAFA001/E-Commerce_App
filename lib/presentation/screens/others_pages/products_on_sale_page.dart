// Flutter imports:
// Project imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../logic/cubit/products_cubit.dart';
import '../../widgets/custom_widgets/products_by_category_list.dart';
import '../../widgets/custom_widgets/shimmer_list.dart';

class ProductsOnSalePage extends StatefulWidget {
  const ProductsOnSalePage({super.key, required this.categories});

  final List<Map<String, dynamic>> categories;

  @override
  State<ProductsOnSalePage> createState() => _ProductsOnSalePageState();
}

class _ProductsOnSalePageState extends State<ProductsOnSalePage> {
  @override
  void initState() {
    super.initState();
    final categories = widget.categories.first["categories"] as List<String>;
    BlocProvider.of<ProductsCubit>(context)
        .getProductsBySeveralCategories(categories);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesCollectionName =
        widget.categories.last["collectionName"] as String;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              categoriesCollectionName,
              style: GoogleFonts.oswald(fontSize: 22, letterSpacing: 1),
            ),
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
