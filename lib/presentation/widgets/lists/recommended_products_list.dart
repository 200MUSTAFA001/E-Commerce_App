// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:api_app/extensions.dart';
import 'package:api_app/presentation/widgets/lists/shimmer_list.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../cards/product_card.dart';

class RecommendedProductsList extends StatelessWidget {
  const RecommendedProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is SeveralListsForHomePageLoaded) {
          final recommendedProducts = state.recommendedProducts;
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ).onlyPadding(left: 16, top: 10),
                SizedBox(
                  height: context.width * 0.7,
                  width: context.height * 1,
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
