import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  List<Product>? products;

  Future<List<Product>> getProductsByCategory(String category) async {
    await productsRepo.getProductsByCategory(category).then((products) {
      emit(ProductsLoaded(products));
      this.products = products;
    });
    return products ?? [];
  }

  Future<void> getProductsBySeveralCategories(List<String> categories) async {
    emit(ProductsLoading());

    List<Product> allProducts = [];

    for (var category in categories) {
      final products = await productsRepo.getProductsByCategory(category);
      allProducts.addAll(products);
    }
    emit(ProductsLoaded(allProducts));
  }
}
