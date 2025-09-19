import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';
import '../../../data/models/order_model.dart';
import 'cancel_order_dialog.dart';

class OrderOptionsButtons extends StatelessWidget {
  const OrderOptionsButtons({
    super.key,
    required this.orderState,
    required this.orderItem,
  });

  final OrderState orderState;
  final OrderItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OrdersCubit>(context);
    switch (orderState) {
      case OrderState.received:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            OutlinedButton(
              onPressed: () {
                context.push(AppRouter.orderDetailsPage, extra: orderItem);
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(context.width * 0.4, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                side: const BorderSide(width: 1, color: Colors.blue),
              ),
              child: const Text(
                "Track",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child:
                        CancelOrderDialog(cubit: cubit, orderItem: orderItem),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.red.shade700),
                fixedSize: Size(context.width * 0.4, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          ],
        );
      case OrderState.delivered:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            OutlinedButton(
              onPressed: () {
                /*Todo: exchange and return options*/
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(context.width * 0.4, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                side: const BorderSide(width: 1),
              ),
              child: const Text(
                "Exchange",
                style: TextStyle(color: Colors.black),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                /*Todo: exchange and return options*/
              },
              style: OutlinedButton.styleFrom(
                fixedSize: Size(context.width * 0.4, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                side: BorderSide(width: 1, color: Colors.red.shade700),
              ),
              child: Text(
                "Return",
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          ],
        );
      case OrderState.cancelled:
        return const SizedBox.shrink();
    }
  }
}
