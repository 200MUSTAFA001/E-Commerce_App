import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/order_model.dart';
import '../../../logic/cubit/hydrated_cubits/orders_cubit.dart';

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({
    super.key,
    required this.cubit,
    required this.orderItem,
  });

  final OrdersCubit cubit;
  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      backgroundColor: Colors.white,
      icon: const Icon(CupertinoIcons.exclamationmark_triangle),
      title: const Text(
        "Do you want to cancel the order ?",
        textAlign: TextAlign.center,
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            context.pop();
          },
          style: OutlinedButton.styleFrom(backgroundColor: Colors.indigo),
          child: const Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            cubit.cancelOrder(orderItem);
            context.pop();
          },
          style: OutlinedButton.styleFrom(backgroundColor: Colors.red.shade600),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
