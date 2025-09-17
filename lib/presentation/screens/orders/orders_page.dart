import 'dart:developer';

import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/orders_cubit.dart';
import 'package:e_commerce_app/presentation/screens/orders/empty_orders_screen.dart';
import 'package:e_commerce_app/presentation/screens/orders/filled_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // to solve the hardware back button to go to home page instead of go back to checkout
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        context.go(AppRouter.homePage);
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.grey.shade50,
              leading: BackButton(
                onPressed: () {
                  context.go(AppRouter.homePage);
                },
              ),
              title: const Text("Orders"),
              // Todo : temp button
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.read<OrdersCubit>().clear();
                    log("message");
                  },
                  child: Text("data"),
                ),
              ],
            ),
            BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersLoaded) {
                  final ordersList = state.ordersList;
                  return FilledOrdersScreen(ordersList: ordersList);
                } else {
                  return const EmptyOrdersScreen();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
