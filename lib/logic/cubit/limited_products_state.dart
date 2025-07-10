part of 'limited_products_cubit.dart';

@immutable
abstract class LimitedProductsState {}

class LimitedProductsInitial extends LimitedProductsState {}

class LimitedProductsLoaded extends LimitedProductsState {
  final List<Product> products;

  LimitedProductsLoaded(this.products);
}

class LimitedProductsLoading extends LimitedProductsState {}

class LimitedProductsLoadError extends LimitedProductsState {}
