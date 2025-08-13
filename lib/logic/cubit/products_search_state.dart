part of 'products_search_cubit.dart';

@immutable
abstract class ProductsSearchState {}

class ProductsSearchInitial extends ProductsSearchState {}

class ProductsSearchLoading extends ProductsSearchState {}

class ProductsSearchLoaded extends ProductsSearchState {
  final List<Product> searchedList;

  ProductsSearchLoaded({required this.searchedList});
}
