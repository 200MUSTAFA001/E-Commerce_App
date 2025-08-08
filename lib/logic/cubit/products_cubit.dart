import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/services/web_services.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<List<Product>> getProductsByCategory(String category) async {
    final List<Product> products = [];
    await productsRepo.getProductsByCategory(category).then((products) async {
      emit(ProductsLoaded(products));
    });
    return products;
  }

  Future<List<Product>> getSeveralListForHomePage(
    String category,
    String recommendedCategory,
    String sublistCategory,
  ) async {
    final List<Product> products = [];
    await productsRepo.getProductsByCategory(category).then((products) async {
      //
      final recommendedProducts = await ProductsRepo(GetProductsService())
          .getProductsByCategory(recommendedCategory);
      //
      final sublistProducts = await ProductsRepo(GetProductsService())
          .getProductsByCategory(sublistCategory);
      //
      emit(SeveralListsForHomePageLoaded(
        products,
        recommendedProducts,
        sublistProducts,
      ));
    });
    //
    return products;
  }

  // Future<List<Product>> getRecommendedProducts(String category) async {
  //   final recommendedProducts = await ProductsRepo(GetProductsService())
  //       .getProductsByCategory(category);
  //   emit(RecommendedProductsLoaded(recommendedProducts));
  //   return recommendedProducts;
  // }

  Future<void> getProductsBySeveralCategories(List<String> categories) async {
    emit(ProductsLoading());

    final List<Product> allProducts = [];

    for (var category in categories) {
      final products = await productsRepo.getProductsByCategory(category);
      allProducts.addAll(products);
    }
    emit(ProductsLoaded(allProducts));
  }
}
