import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/products_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/custom_widgets/shimmer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/cubit/hydrated_cubits/orders_cubit.dart';
import '../../widgets/custom_widgets/product_card.dart';
import '../../widgets/orders_custom_widgets/delivery_status.dart';
import '../../widgets/orders_custom_widgets/order_info.dart';
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
    final productsCategories = widget.orderItem.orderDetails.orderProducts
        .map((a) => a.product.category)
        .toList();
    context
        .read<ProductsCubit>()
        .getProductsBySeveralCategories(productsCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoaded) {
            final updatedOrderItem = state.ordersList.firstWhere(
                (order) => order.orderID == widget.orderItem.orderID,
                orElse: () => widget.orderItem);
            //
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text("Order Details"),
                  backgroundColor: Colors.white,
                  pinned: true,
                ),
                SliverList.builder(
                  itemCount: updatedOrderItem.orderDetails.orderProducts.length,
                  itemBuilder: (context, index) => OrderProductCard(
                      orderProduct:
                          updatedOrderItem.orderDetails.orderProducts[index]),
                ),
                const DeliveryStatus(/*Todo : NOT DONE*/),
                OrderInfo(checkoutDetails: updatedOrderItem),
                OrderOptions(orderItem: updatedOrderItem),
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                      return const ShimmerList();
                    }
                  },
                )
              ],
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.deepOrangeAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
