import 'dart:developer';

import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:flutter/material.dart';

class FilledOrdersScreen extends StatelessWidget {
  const FilledOrdersScreen({super.key, required this.ordersList});

  final List<OrderModel> ordersList;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              log("$ordersList");
              log("${ordersList.length}");
              log("${ordersList.map((s) => s.orderID)}");
              log("${ordersList.map((s) => s.orderItems.map((a) => a.product.title))}");
              log("${ordersList.map((s) => s.orderReceivedDate)}");
              log("${ordersList.map((s) => s.orderState.name)}");
            },
            child: Text("data")),
      ),
    );
  }
}
