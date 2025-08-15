part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<Product> wishlist;

  WishlistLoaded({required this.wishlist});
}

final class WishlistEmpty extends WishlistState {}
