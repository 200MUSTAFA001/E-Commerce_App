import 'package:api_app/data/models/products_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends HydratedCubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesLoaded(favoritesList: const []));

  bool isProductExist(int productID) {
    final storiedList = (state as FavoritesLoaded).favoritesList;
    final productIDs = storiedList.map((product) => product.id).toList();

    final isProductExistBool = productIDs.contains(productID) ? true : false;

    return isProductExistBool;
  }

  void addProduct(Product product) {
    final storiedList = (state as FavoritesLoaded).favoritesList;
    final updatedList = List<Product>.from(storiedList);
    updatedList.add(product);
    emit(FavoritesLoaded(favoritesList: updatedList));
  }

  void removeProduct(Product removedProduct) {
    final storiedList = (state as FavoritesLoaded).favoritesList;
    final updatedList = storiedList
        .where((product) => product.id != removedProduct.id)
        .toList();
    emit(FavoritesLoaded(favoritesList: updatedList));
  }

  void clearFavorites() {
    final storiedList = (state as FavoritesLoaded).favoritesList;
    storiedList.clear();
    final updatedList = storiedList;
    emit(FavoritesLoaded(favoritesList: updatedList));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    final favoritesJsonList = json["favoritesList"] as List;
    final favoritesList =
        favoritesJsonList.map((product) => Product.fromJson(product)).toList();
    return FavoritesLoaded(favoritesList: favoritesList);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    final storiedList = (state as FavoritesLoaded).favoritesList;
    return {
      "favoritesList": storiedList.map((product) => product.toJson()).toList()
    };
  }
}
