import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'limited_products_state.dart';

class LimitedProductsCubit extends Cubit<LimitedProductsState> {
  LimitedProductsCubit(this.productsRepo) : super(LimitedProductsInitial());

  final ProductsRepo productsRepo;

  List<Product>? products;

  List<Product> getLimitedProducts(String category) {
    productsRepo.getLimitedProductsByCategory(category).then((products) {
      emit(LimitedProductsLoaded(products));
      this.products = products;
    });
    return products ?? [];
  }
}
