import 'package:api_app/data/repository/categories_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  late List<String> categories;

  List<String> getCategories() {
    categoriesRepo.getAllCategories().then((categories) {
      emit(CategoriesLoaded(categories));
      this.categories = categories ?? [];
    });
    return categories;
  }
}
