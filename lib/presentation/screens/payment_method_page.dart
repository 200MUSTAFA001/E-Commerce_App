import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/checkout_details_model.dart';
import '../widgets/payment_method_page_custom_widgets/payment_options.dart';

class PaymentMethodPage extends StatelessWidget {
  PaymentMethodPage({super.key, required this.checkoutDetails});

  final CheckoutDetailsModel checkoutDetails;

  int selectedPayment = 0;
  String paymentMethod = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Payment Method"),
          ),
          PaymentOptions(
            paymentMethod: (value) {
              paymentMethod = value;
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FilledButton(
                onPressed: () {
                  final checkoutDetailsUpdated =
                      checkoutDetails.copyWith(paymentMethod: paymentMethod);
                  context.push(AppRouter.checkOutPage,
                      extra: checkoutDetailsUpdated);
                },
                style: FilledButton.styleFrom(
                  fixedSize: const Size(200, 60),
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Make Payment",
                  style: TextStyle(fontSize: 20),
                ),
              ).paddingOnly(right: 10, bottom: 16),
            ),
          ),
        ],
      ),
    );
  }
}
