import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.productsRepo) : super(AllProductsInitial());

  final ProductsRepo productsRepo;
  List<Product>? products;

  List<Product> getAllProducts(String category) {
    productsRepo.getAllProducts(category).then((products) {
      emit(AllProductsLoaded(products));
      this.products = products;
    });
    return products ?? [];
  }

  Future<void> getProductsBySeveralCategories(List<String> categories) async {
    emit(AllProductsLoading());

    List<Product> allProducts = [];

    for (var category in categories) {
      final products = await productsRepo.getAllProducts(category);
      allProducts.addAll(products);
    }
    emit(AllProductsLoaded(allProducts));
  }
}
