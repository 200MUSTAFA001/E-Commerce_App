part of 'platzi_products_cubit.dart';

@immutable
sealed class PlatziProductsState {}

class PlatziProductsInitial extends PlatziProductsState {}

class PlatziProductsLoaded extends PlatziProductsState {
  final List<PlatziProduct> products;

  PlatziProductsLoaded(this.products);
}
