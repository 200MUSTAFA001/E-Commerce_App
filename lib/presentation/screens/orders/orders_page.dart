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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(
              onPressed: () {
                context.pop();
              },
            ),
            title: const Text("Orders"),
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
    );
  }
}
