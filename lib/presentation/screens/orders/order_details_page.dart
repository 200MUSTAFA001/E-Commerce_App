import 'package:dartx/dartx.dart';
import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_widgets/product_card.dart';
import '../../widgets/custom_widgets/shimmer_list.dart';
import '../../widgets/orders_custom_widgets/order_options.dart';
import '../../widgets/orders_custom_widgets/order_product_card.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.orderItem});

  final OrderItemModel orderItem;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    final productsCategories =
        widget.orderItem.orderItems.map((a) => a.product.category).toList();
    context
        .read<ProductsCubit>()
        .getProductsBySeveralCategories(productsCategories);
  }

  Color orderStateColor() {
    switch (widget.orderItem.orderState) {
      case OrderState.received:
        return Colors.blue.shade50;
      case OrderState.delivered:
        return Colors.green.shade50;
      case OrderState.cancelled:
        return Colors.red.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderDate = widget.orderItem.orderDeliveredDate ??
        widget.orderItem.orderCancelledDate ??
        widget.orderItem.orderReceivedDate;
    final date = DateFormat("d MMMM y").format(orderDate);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Order Details"),
            backgroundColor: Colors.white,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ORDER ID: ${widget.orderItem.orderID}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: widget.orderItem.orderID));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("ID Copied")),
                    );
                  },
                  child: const Row(
                    children: [Icon(Icons.copy_rounded), Text("Copy")],
                  ),
                ),
              ],
            ).paddingAll(12),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: orderStateColor(),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ${widget.orderItem.orderState.name.capitalize()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(date),
                ],
              ).paddingAll(12),
            ).paddingAll(10),
          ),
          SliverList.builder(
            itemCount: widget.orderItem.orderItems.length,
            itemBuilder: (context, index) => OrderProductCard(
                orderProduct: widget.orderItem.orderItems[index]),
          ),
          OrderOptions(orderItem: widget.orderItem),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                final products = state.products;
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "You may like",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          MaterialButton(
                            onPressed: () {
                              context.push(AppRouter.youMayLikePage,
                                  extra: products);
                            },
                            child: const Row(
                              children: [
                                Text("View All"),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 16, top: 10),
                      SizedBox(
                        height: context.height * 0.4,
                        width: context.width * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) => ProductCard(
                            product: products[index],
                          ),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 12),
                );
              } else {
                return const ShimmerList(
                  cardsCount: 4,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
