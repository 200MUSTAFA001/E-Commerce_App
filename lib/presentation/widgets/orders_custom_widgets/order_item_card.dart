import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../app_router.dart';
import '../../../data/models/order_model.dart';
import 'order_options.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.orderItem});

  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    final ordersProductsName = orderItem.orderItems
        .map((product) => product.product.title)
        .toList()
        .toString();
    final orderDate = orderItem.orderDeliveredDate ??
        orderItem.orderCancelledDate ??
        orderItem.orderReceivedDate;
    final date = DateFormat("d MMM y").format(orderDate);
    return InkWell(
      onTap: () {
        context.push(AppRouter.orderDetailsPage, extra: orderItem);
      },
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                context.push(AppRouter.orderDetailsPage, extra: orderItem);
              },
              leading: orderStateIcon(orderItem.orderState),
              title: Text("Order ${orderItem.orderState.name.capitalize()}"),
              subtitle: Text(date),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading:
                  Image.network(orderItem.orderItems.first.product.thumbnail),
              title: Text(
                ordersProductsName.removeSurrounding(prefix: "[", suffix: "]"),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Items: ${orderItem.orderItems.length}"),
            ),
            const SizedBox(height: 20),
            OrderOptions(
              orderState: orderItem.orderState,
              context: context,
              orderItem: orderItem,
            ),
          ],
        ),
      ),
    );
  }
}

Widget orderStateIcon(OrderState orderState) {
  switch (orderState) {
    case OrderState.received:
      return CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: const Icon(Icons.watch_later_outlined, color: Colors.blue),
      );
    case OrderState.delivered:
      return CircleAvatar(
        backgroundColor: Colors.green.shade50,
        child: const Icon(Icons.done, color: Colors.green),
      );
    case OrderState.cancelled:
      return CircleAvatar(
        backgroundColor: Colors.red.shade50,
        child: const Icon(Icons.cancel_outlined, color: Colors.red),
      );
  }
}
