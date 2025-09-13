import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyOrdersScreen extends StatelessWidget {
  const EmptyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Image.asset("assets/no_data/noDataOrders.webp"),
          const Text(
            "No Orders Found!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ).paddingOnly(top: 30),
          const Text(
            "Currently you don't have any orders. When you order something. it will appear here",
            style: TextStyle(color: Colors.black54, fontSize: 17),
            textAlign: TextAlign.center,
          ).paddingOnly(bottom: 32),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: Size(context.width * 0.8, 60),
            ),
            child: const Text(
              "Start Shopping",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ).paddingOnly(bottom: 40)
        ],
      ).paddingAll(10),
    );
  }
}
