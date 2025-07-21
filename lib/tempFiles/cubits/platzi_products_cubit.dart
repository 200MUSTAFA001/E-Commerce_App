import 'package:api_app/data/models/platzi_Product.dart';
import 'package:api_app/tempFiles/repos/platzi_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'platzi_products_state.dart';

class PlatziProductsCubit extends Cubit<PlatziProductsState> {
  PlatziProductsCubit(this.platziRepo) : super(PlatziProductsInitial());

  final PlatziRepo platziRepo;

  List<PlatziProduct> products = [];

  List<PlatziProduct> getPlatziProductsByCategory(String category) {
    platziRepo.getProductByCategory(category).then((products) {
      emit(PlatziProductsLoaded(products));
      this.products = products;
    });
    return products;
  }
}
