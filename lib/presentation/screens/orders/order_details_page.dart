import 'package:dartx/dartx.dart';
import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/presentation/widgets/orders_custom_widgets/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.orderItem});

  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Order Details"),
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ORDER ID: ${orderItem.orderID}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: orderItem.orderID));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("ID Copied")),
                      );
                    },
                    icon: const Icon(Icons.copy_rounded))
              ],
            ).paddingAll(12),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.blue.shade50,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ${orderItem.orderState.name.capitalize()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(orderItem.orderReceivedDate.toString())
                ],
              ).paddingAll(12),
            ).paddingAll(10),
          ),
          SliverList.builder(
            itemCount: orderItem.orderItems.length,
            itemBuilder: (context, index) => ListTile(
              leading:
                  Image.network(orderItem.orderItems[index].product.thumbnail),
              title: Text(orderItem.orderItems[index].product.title),
              subtitle:
                  Text(r"$" " ${orderItem.orderItems[index].product.price}"),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: orderStateIcon(orderItem.orderState),
                title: const Text(
                  "Track Order",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ).paddingAll(8),
          ),
          SliverToBoxAdapter(
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade50,
                  child: Icon(Icons.cancel, color: Colors.red.shade700),
                ),
                title: const Text(
                  "Cancel Order",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ).paddingAll(8),
          ),
        ],
      ),
    );
  }
}
