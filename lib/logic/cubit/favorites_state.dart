part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final List<Product> favoritesList;

  FavoritesLoaded({required this.favoritesList});
}
