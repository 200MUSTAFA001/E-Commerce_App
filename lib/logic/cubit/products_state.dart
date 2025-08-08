part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class SeveralListsForHomePageLoaded extends ProductsState {
  final List<Product> products;
  final List<Product> recommendedProducts;
  final List<Product> sublistProducts;

  SeveralListsForHomePageLoaded(
    this.products,
    this.recommendedProducts,
    this.sublistProducts,
  );
}

class ProductsLoading extends ProductsState {}

class ProductsLoadError extends ProductsState {}
