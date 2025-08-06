part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  final List<Product> recommendedProducts;

  ProductsLoaded(this.products, this.recommendedProducts);
}

class ProductsLoading extends ProductsState {}

class ProductsLoadError extends ProductsState {}
