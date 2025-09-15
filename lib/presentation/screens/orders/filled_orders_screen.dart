import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';

import '../../widgets/orders_custom_widgets/order_item_card.dart';

class FilledOrdersScreen extends StatelessWidget {
  const FilledOrdersScreen({super.key, required this.ordersList});

  final List<OrderItemModel> ordersList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: ordersList.length,
      itemBuilder: (context, index) =>
          OrderItemCard(orderItem: ordersList[index])
              .paddingOnly(left: 8, right: 8, bottom: 12, top: 10),
    );
  }
}
