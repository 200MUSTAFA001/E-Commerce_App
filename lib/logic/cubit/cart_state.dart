part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final List<CartItem> cartProducts;

  CartLoaded({required this.cartProducts});
}

final class CartEmpty extends CartState {}
