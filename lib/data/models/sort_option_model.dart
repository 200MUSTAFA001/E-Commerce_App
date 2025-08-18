// Project imports:
import 'package:api_app/data/models/sort_type_enm.dart';

class SortOptionModel {
  final int index;
  final String sortTitle;
  final SortType sortType;

  SortOptionModel(
      {required this.index, required this.sortTitle, required this.sortType});
}
