import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/data/models/cart_to_checkout_model.dart';
import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../widgets/custom_widgets/checkout_dialog.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key, required this.checkoutDetails});

  final CartToCheckoutModel checkoutDetails;
  final time = DateTime.now();

  OrderModel? orderItem;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("d MMM y, HH:mm").format(time);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(
              onPressed: () {
                context.pop();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Check Out",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Payment information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "$date ${checkoutDetails.paymentMethod}",
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRowText(
                      rowTitle: "Subtotal Price",
                      rowValue:
                          r"$" "${checkoutDetails.subtotal.toStringAsFixed(1)}",
                    ),
                    CustomRowText(
                      rowTitle: "Discount",
                      rowValue: r"- $"
                          "${checkoutDetails.discounts.toStringAsFixed(1)}",
                    ),
                    CustomRowText(
                      rowTitle: "Shipping fee",
                      rowValue: r"+ $"
                          "${checkoutDetails.shippingFee.toStringAsFixed(1)}",
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          r"$" "${checkoutDetails.total.toStringAsFixed(1)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  "Shipping Address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  checkoutDetails.shippingAddress,
                  style: const TextStyle(fontSize: 18),
                  maxLines: 2,
                ),
              ],
            ).paddingAll(28),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width * 0.9,
                height: 100,
                child: SlideAction(
                  text: "Check Out",
                  textColor: Colors.black,
                  textStyle: GoogleFonts.bricolageGrotesque(
                      fontSize: 30, fontWeight: FontWeight.w500),
                  outerColor: Colors.white,
                  innerColor: Colors.deepOrangeAccent,
                  onSubmit: () {
                    // Todo : refactor
                    checkoutDialog(context);
                    orderItem = OrderModel(
                      orderID: date,
                      orderItems: checkoutDetails.orderProducts,
                      orderState: OrderState.received,
                      orderReceivedDate: time,
                    );
                    return Future.delayed(const Duration(milliseconds: 500),
                        () {
                      if (context.mounted) {
                        context.read<OrdersCubit>().addOrder(orderItem!);
                        context.push(AppRouter.ordersPage);
                      }
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
    required this.rowTitle,
    required this.rowValue,
  });

  final String rowTitle;
  final String rowValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        Text(
          rowValue,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
