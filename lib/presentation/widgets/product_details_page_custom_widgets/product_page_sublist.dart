import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/products_model.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../custom_widgets/product_card.dart';
import '../custom_widgets/shimmer_list.dart';

class ProductPageSubList extends StatelessWidget {
  const ProductPageSubList({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final productPageSubList = state.products;
          productPageSubList
              .removeWhere((products) => products.id == product.id);
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "You may like",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ).onlyPadding(left: 16, top: 30),
                Card(
                  elevation: 1,
                  semanticContainer: false,
                  color: Colors.white,
                  child: SizedBox(
                    height: context.height * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productPageSubList.length,
                      itemBuilder: (context, index) => ProductCard(
                        product: productPageSubList[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const ShimmerList(cardsCount: 4);
        }
      },
    );
  }
}
