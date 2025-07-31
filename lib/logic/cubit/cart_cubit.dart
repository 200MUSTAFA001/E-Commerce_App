import 'package:api_app/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cart_state.dart';

class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartLoaded(cartProducts: const []));

  void addProduct(Product product, int quantity) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final updatedList = [
      ...cartProducts,
      product.copyWith(productQuantity: quantity)
    ];
    emit(CartLoaded(cartProducts: updatedList));
  }

  void removeProduct(Product removedProduct) {
    final cartProducts = (state as CartLoaded).cartProducts;
    final updatedList = cartProducts
        .where((product) => product.id != removedProduct.id)
        .toList();
    emit(CartLoaded(cartProducts: updatedList));
  }

  void updateQuantity(int productId, int productQuantity) {
    final cartProducts = (state as CartLoaded).cartProducts;
    cartProducts.map((product) {
      if (product.id == productId) {
        return product.copyWith(productQuantity: productQuantity);
      }
      return product;
    }).toList();
    emit(CartLoaded(cartProducts: cartProducts));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    final jsonList = json["cartList"] as List;
    final cartList =
        jsonList.map((product) => Product.fromJson(product)).toList();
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

// @override
// List<Product> fromJson(Map<String, dynamic> json) {
//   final jsonCartProducts = json["products"] as List<dynamic>;
//   return jsonCartProducts
//       .map((product) => Product.fromJson(product))
//       .toList();
// }
//
// @override
// Map<String, dynamic>? toJson(List<Product> state) =>
//     {"products": state.map((value) => value.toJson()).toList()};
