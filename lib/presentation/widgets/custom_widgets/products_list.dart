import 'package:api_app/presentation/widgets/custom_widgets/products_by_category_list.dart';
import 'package:api_app/presentation/widgets/custom_widgets/shimmer_list.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/products_cubit.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is SeveralListsForHomePageLoaded) {
          final products = state.products;
          return ProductsGrid(
            itemCount: 4,
            products: products,
          );
        } else {
          return const ShimmerList(
            cardsCount: 4,
          );
        }
      },
    );
  }
}
