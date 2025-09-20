import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/order_model.dart';
import '../../../logic/cubit/hydrated_cubits/orders_cubit.dart';
import 'cancel_order_dialog.dart';
import 'order_item_card.dart';

class OrderOptions extends StatelessWidget {
  const OrderOptions({super.key, required this.orderItem});

  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OrdersCubit>(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          orderItem.orderState == OrderState.cancelled
              ? const SizedBox.shrink()
              : Card(
                  elevation: 0,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      /*Todo : bottom sheet package track*/
                    },
                    leading: orderStateIcon(orderItem.orderState),
                    title: const Text(
                      "Track Order",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ).paddingAll(8),
          orderItem.orderState == OrderState.received
              ? Card(
                  elevation: 0,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => BlocProvider.value(
                          value: cubit,
                          child: CancelOrderDialog(
                              cubit: cubit, orderItem: orderItem),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.red.shade50,
                      child: Icon(Icons.cancel, color: Colors.red.shade700),
                    ),
                    title: const Text(
                      "Cancel Order",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ).paddingAll(8)
              : const SizedBox.shrink(),
          orderItem.orderState == OrderState.delivered
              ? const SizedBox(/*Todo: exchange and return options*/)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
