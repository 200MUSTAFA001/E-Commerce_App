import 'package:api_app/data/models/product_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fake_store_products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  List<Product> products = [];

  List<Product> getProductsByCategory(String category) {
    productsRepo.getProductsByCategory(category).then((products) {
      emit(ProductsLoaded(products));
      this.products = products;
    });
    return products;
  }
}
