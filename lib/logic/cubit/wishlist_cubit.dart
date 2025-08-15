// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';

// Project imports:
import 'package:api_app/data/models/products_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends HydratedCubit<WishlistState> {
  WishlistCubit() : super(WishlistLoaded(wishlist: const []));

  bool isProductExist(int productID) {
    final storiedList = (state as WishlistLoaded).wishlist;
    final productIDs = storiedList.map((product) => product.id).toList();

    final isProductExistBool = productIDs.contains(productID) ? true : false;

    return isProductExistBool;
  }

  void addProduct(Product product) {
    final storiedList = (state as WishlistLoaded).wishlist;
    final updatedList = List<Product>.from(storiedList);
    updatedList.add(product);
    emit(WishlistLoaded(wishlist: updatedList));
  }

  void removeProduct(Product removedProduct) {
    final storiedList = (state as WishlistLoaded).wishlist;
    final updatedList = storiedList
        .where((product) => product.id != removedProduct.id)
        .toList();
    emit(WishlistLoaded(wishlist: updatedList));
  }

  void clearWishlist() {
    final storiedList = (state as WishlistLoaded).wishlist;
    storiedList.clear();
    final updatedList = storiedList;
    emit(WishlistLoaded(wishlist: updatedList));
  }

  @override
  WishlistState? fromJson(Map<String, dynamic> json) {
    final favoritesJsonList = json["favoritesList"] as List;
    final favoritesList =
        favoritesJsonList.map((product) => Product.fromJson(product)).toList();
    return WishlistLoaded(wishlist: favoritesList);
  }

  @override
  Map<String, dynamic>? toJson(WishlistState state) {
    final storiedList = (state as WishlistLoaded).wishlist;
    return {
      "favoritesList": storiedList.map((product) => product.toJson()).toList()
    };
  }
}
