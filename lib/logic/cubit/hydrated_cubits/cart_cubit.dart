// Flutter imports:
// Project imports:
import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/presentation/widgets/custom_widgets/product_card.dart';
// Package imports:
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartInitial());

  bool isProductExist(Product product) {
    final currentState = state;

    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);

      final cartProductsIDs =
          cartProducts.map((product) => product.product.id).toList();

      final isProductExistBool =
          cartProductsIDs.contains(product.id) ? true : false;

      return isProductExistBool;
    }
    return false;
  }

  void addProduct(Product product, int quantity) {
    final currentState = state;

    try {
      if (currentState is CartLoaded) {
        final cartProducts = List<CartItem>.from(currentState.cartProducts);
        cartProducts.add(CartItem(product: product, productQuantity: quantity));

        emit(CartLoaded(cartProducts: cartProducts));
      } else {
        emit(CartLoaded(cartProducts: [
          CartItem(product: product, productQuantity: quantity)
        ]));
      }
    } catch (e) {
      emit(CartError());
    }
  }

  void removeProduct(Product removedProduct) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);

      cartProducts
          .removeWhere((product) => product.product.id == removedProduct.id);

      if (cartProducts.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartLoaded(cartProducts: cartProducts));
      }
    }
  }

  void clearCart() {
    final currentState = state;
    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);

      cartProducts.clear();
      emit(CartEmpty());
    }
  }

  int cartLength() {
    final currentState = state;
    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);
      final cartLength =
          cartProducts.map((product) => product.productQuantity).toList().sum();
      return cartLength;
    }
    return 0;
  }

  List<int> getProductsPrices() {
    final currentState = state;

    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);
      final pricesBeforeDiscount = cartProducts
          .map((product) {
            final productsPrices = product.productQuantity *
                priceBeforeDiscount(
                    product.product.price, product.product.discountPercentage);
            return productsPrices;
          })
          .toList()
          .sum()
          .toInt();
      //
      final pricesAfterDiscount = cartProducts
          .map((product) {
            final productsPrices =
                product.productQuantity * product.product.price;
            return productsPrices;
          })
          .toList()
          .sum()
          .toInt();
      //
      final totalDiscount =
          (pricesBeforeDiscount - pricesAfterDiscount).toInt();

      return [pricesBeforeDiscount, totalDiscount, pricesAfterDiscount];
    } else {
      emit(CartEmpty());
      return [];
    }
  }

  CartItem? getCartItem(int cartItemID) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);
      final cartItem = cartProducts
          .firstWhere((product) => product.product.id == cartItemID);
      return cartItem;
    }
    return null;
  }

  void updateQuantity(int productId, int productQuantity) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final cartProducts = List<CartItem>.from(currentState.cartProducts);
      final updatedList = cartProducts.map((product) {
        if (product.product.id == productId) {
          return product.copyWith(productQuantity: productQuantity);
        }
        return product;
      }).toList();
      emit(CartLoaded(cartProducts: updatedList));
    }
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final cartJsonList = json["cartList"] as List;
      final cartList =
          cartJsonList.map((product) => CartItem.fromJson(product)).toList();

      if (cartList.isEmpty) {
        return CartEmpty();
      } else {
        return CartLoaded(cartProducts: cartList);
      }
    } catch (e) {
      return CartError();
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    final currentState = state;
    if (currentState is CartLoaded) {
      final storedProducts = List<CartItem>.from(currentState.cartProducts);
      return {
        "cartList": storedProducts.map((product) => product.toJson()).toList()
      };
    } else {
      final List<Map<String, dynamic>> emptyList = [];
      return {"cartList": emptyList};
    }
  }
}
