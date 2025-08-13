import 'package:api_app/data/models/products_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_search_state.dart';

class ProductsSearchCubit extends Cubit<ProductsSearchState> {
  ProductsSearchCubit() : super(ProductsSearchInitial());
  // Todo : get search list
}
