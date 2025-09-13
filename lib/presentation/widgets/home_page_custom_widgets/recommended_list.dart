// Flutter imports:
// Project imports:
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/products_cubit.dart';
import '../custom_widgets/product_card.dart';
import '../custom_widgets/shimmer_list.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is SeveralListsForHomePageLoaded) {
          final recommendedProducts = state.recommendedProducts;
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ).paddingOnly(left: 16, top: 10),
                SizedBox(
                  height: context.height * 0.4,
                  width: context.width * 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedProducts.length,
                    itemBuilder: (context, index) => ProductCard(
                      product: recommendedProducts[index],
                    ),
                  ),
                ),
              ],
            ),
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
