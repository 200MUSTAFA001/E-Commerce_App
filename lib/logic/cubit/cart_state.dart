part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

final class CartLoaded extends CartState {
  final List<Product> cartProducts;

  CartLoaded({required this.cartProducts});
}
