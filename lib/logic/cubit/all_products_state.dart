part of 'all_products_cubit.dart';

@immutable
abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<Product> products;

  AllProductsLoaded(this.products);
}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoadError extends AllProductsState {}
