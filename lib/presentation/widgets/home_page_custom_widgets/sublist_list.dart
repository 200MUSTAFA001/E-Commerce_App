// Flutter imports:
// Project imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/products_cubit.dart';
import '../custom_widgets/product_card.dart';
import '../custom_widgets/shimmer_list.dart';

class SublistProducts extends StatelessWidget {
  const SublistProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is SeveralListsForHomePageLoaded) {
          final sublistProducts = state.sublistProducts;
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Hot Selling Footwear",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ).onlyPadding(left: 16, top: 10),
                SizedBox(
                  height: context.height * 0.4,
                  width: context.width * 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sublistProducts.length,
                    itemBuilder: (context, index) => ProductCard(
                      product: sublistProducts[index],
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
