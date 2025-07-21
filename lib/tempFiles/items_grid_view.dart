import 'package:api_app/data/models/platzi_Product.dart';
import 'package:api_app/presentation/widgets/cards/item_card.dart';
import 'package:flutter/material.dart';

import 'models/product_model.dart';

List<Product>? productsOnSale(List<Product> products) {
  List<Product> productsOnSale = [];
  for (var product in products) {
    if (product.discount != null) {
      productsOnSale.add(product);
    }
  }
  return productsOnSale;
}

class FakeStoreItemsGrid extends StatelessWidget {
  const FakeStoreItemsGrid({super.key, required this.fakeProducts});

  final List<Product> fakeProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: GridView.builder(
        padding: const EdgeInsets.only(right: 20, left: 20),
        itemCount: productsOnSale(fakeProducts)!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 9 / 16,
        ),
        itemBuilder: (context, index) => Banner(
          message: "${productsOnSale(fakeProducts)![index].discount}",
          textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          color: Colors.red,
          location: BannerLocation.topEnd,
          shadow: const BoxShadow(
            color: Colors.black,
            blurRadius: 20,
            spreadRadius: 200,
            offset: Offset(0, 2),
          ),
          child: ItemCard(
            itemName: productsOnSale(fakeProducts)![index].title,
            itemImage: productsOnSale(fakeProducts)![index].image,
          ),
        ),
      ),
    );
  }
}

class PlatziItemsGrid extends StatelessWidget {
  const PlatziItemsGrid({super.key, required this.platziProducts});

  final List<PlatziProduct> platziProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: GridView.builder(
        padding: const EdgeInsets.only(right: 20, left: 20),
        itemCount: platziProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14,
          crossAxisSpacing: 20,
          childAspectRatio: 9 / 14,
        ),
        itemBuilder: (context, index) => ItemCard(
          itemName: platziProducts[index].title,
          itemImage: platziProducts[index].images.first,
        ),
      ),
    );
  }
}
