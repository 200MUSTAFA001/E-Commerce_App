import 'package:api_app/data/models/products_model.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartLoaded(cartProducts: const []));

  bool isProductExist(Product product) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final cartProductsIDs =
        cartProducts.map((product) => product.product.id).toList();

    final isProductExistBool =
        cartProductsIDs.contains(product.id) ? true : false;

    return isProductExistBool;
  }

  void addProduct(Product product, int quantity) {
    final cartProducts = (state as CartLoaded).cartProducts;

    final updatedList = List<CartItem>.from(cartProducts);
    updatedList.add(CartItem(product: product, productQuantity: quantity));

    emit(CartLoaded(cartProducts: updatedList));
  }

  void removeProduct(Product removedProduct) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final updatedList = cartProducts
        .where((product) => product.product.id != removedProduct.id)
        .toList();
    emit(CartLoaded(cartProducts: updatedList));
  }

  void clearCart() {
    final cartProducts = (state as CartLoaded).cartProducts;
    cartProducts.clear();
    final updatedList = cartProducts;
    emit(CartLoaded(cartProducts: updatedList));
  }

  String getProductsPrices() {
    final cartProducts = (state as CartLoaded).cartProducts;
    if (cartProducts.isNotEmpty) {
      final productsPrices = cartProducts
          .map((product) {
            final productsPrices =
                product.productQuantity * product.product.price;
            return productsPrices;
          })
          .toList()
          .sum()
          .toStringAsFixed(2);

      return productsPrices;
    } else {
      return "0";
    }
  }

  CartItem getCartItem(int cartItemID) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final cartItem =
        cartProducts.firstWhere((product) => product.product.id == cartItemID);
    return cartItem;
  }

  void updateQuantity(int productId, int productQuantity) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final updatedList = cartProducts.map((product) {
      if (product.product.id == productId) {
        return product.copyWith(productQuantity: productQuantity);
      }
      return product;
    }).toList();
    emit(CartLoaded(cartProducts: updatedList));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    final cartJsonList = json["cartList"] as List;
    final cartList =
        cartJsonList.map((product) => CartItem.fromJson(product)).toList();
    return CartLoaded(cartProducts: cartList);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    final storedProducts = (state as CartLoaded).cartProducts;
    return {
      "cartList": storedProducts.map((product) => product.toJson()).toList()
    };
  }
}
