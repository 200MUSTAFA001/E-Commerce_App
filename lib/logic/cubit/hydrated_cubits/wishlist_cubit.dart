// Flutter imports:
// Project imports:
import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends HydratedCubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  bool isProductExist(int productID) {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final storiedList = List<Product>.from(currentState.wishlist);

      final isProductExistBool =
          storiedList.any((product) => product.id == productID);

      return isProductExistBool;
    } else {
      return false;
    }
  }

  void addProduct(Product product) {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final wishList = List<Product>.from(currentState.wishlist);
      wishList.add(product);
      emit(WishlistLoaded(wishlist: wishList));
    } else {
      emit(WishlistLoaded(wishlist: [product]));
    }
  }

  void removeProduct(Product removedProduct) {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final wishList = List<Product>.from(currentState.wishlist);
      wishList.removeWhere((product) => product.id == removedProduct.id);

      if (wishList.isNotEmpty) {
        emit(WishlistLoaded(wishlist: wishList));
      } else {
        emit(WishlistEmpty());
      }
    }
  }

  void clearWishlist() {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final wishList = List<Product>.from(currentState.wishlist);
      wishList.clear();
      emit(WishlistEmpty());
    }
  }

  @override
  WishlistState? fromJson(Map<String, dynamic> json) {
    try {
      final jsonWishList = json["wishList"] as List;
      final wishList =
          jsonWishList.map((product) => Product.fromJson(product)).toList();

      if (wishList.isEmpty) {
        return WishlistEmpty();
      } else {
        return WishlistLoaded(wishlist: wishList);
      }
    } catch (e) {
      return WishlistError();
    }
  }

  @override
  Map<String, dynamic>? toJson(WishlistState state) {
    final currentState = state;
    if (currentState is WishlistLoaded) {
      final wishList = List<Product>.from(currentState.wishlist);
      return {"wishList": wishList.map((product) => product.toJson()).toList()};
    } else {
      final wishList = [];
      return {"wishList": wishList};
    }
  }
}
