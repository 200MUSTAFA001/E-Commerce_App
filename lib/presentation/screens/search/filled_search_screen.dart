// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../data/models/products_model.dart';
import '../../widgets/lists/products_by_category_list.dart';

class FilledSearchScreen extends StatelessWidget {
  const FilledSearchScreen({
    super.key,
    required this.searchList,
  });

  final List<Product> searchList;

  @override
  Widget build(BuildContext context) {
    return ProductsGrid(products: searchList, itemCount: searchList.length);
  }
}
