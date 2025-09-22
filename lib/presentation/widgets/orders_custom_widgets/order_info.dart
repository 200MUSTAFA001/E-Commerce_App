import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../data/models/order_model.dart';
import '../../screens/checkout_page.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.checkoutDetails});

  final OrderItemModel checkoutDetails;

  @override
  Widget build(BuildContext context) {
    final orderDate = checkoutDetails.orderDeliveredDate ??
        checkoutDetails.orderCancelledDate ??
        checkoutDetails.orderReceivedDate;
    //
    final orderTime = DateFormat("d MMM y, HH:MM").format(orderDate);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          const Divider(thickness: 2).paddingOnly(top: 8, bottom: 8),
          const Text(
            "Payment Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(),
          CustomRowText(
              rowTitle: "Subtotal",
              rowValue: "EGP ${checkoutDetails.orderDetails.subtotal}"),
          CustomRowText(
              rowTitle: "Discounts",
              rowValue:
                  "- EGP ${checkoutDetails.orderDetails.discounts.toStringAsFixed(1)}"),
          CustomRowText(
              rowTitle: "Shipping",
              rowValue:
                  "+ EGP ${checkoutDetails.orderDetails.shippingFee.toStringAsFixed(1)}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order Total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "EGP ${checkoutDetails.orderDetails.total.toStringAsFixed(1)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Divider(thickness: 2).paddingOnly(top: 8, bottom: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order Information",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                checkoutDetails.orderDetails.paymentMethod,
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(),
          InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: checkoutDetails.orderID));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("ID Copied")),
              );
            },
            child: CustomRowText(
                rowTitle: "Order ID", rowValue: "#${checkoutDetails.orderID}"),
          ),
          CustomRowText(rowTitle: "Order Time", rowValue: orderTime),
          const Divider(thickness: 2).paddingOnly(top: 8, bottom: 8),
          const Text(
            "Shipping Address",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            checkoutDetails.orderDetails.shippingAddress,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ).paddingAll(18),
    );
  }
}
