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
  late AllProductsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AllProductsCubit>();
    cubit.getProductsBySeveralCategories(widget.categories ?? []);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("منتجات حسب العروض")),
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoaded) {
            final mergedProducts = state.products;
            return ListView.builder(
              itemCount: mergedProducts.length,
              itemBuilder: (context, index) {
                final product = mergedProducts[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.category),
                );
              },
            );
          } else if (state is AllProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
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
