import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends HydratedCubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void addOrder(OrderItemModel orderItem) {
    final currentState = state;
    if (currentState is OrdersLoaded) {
      final ordersList = List<OrderItemModel>.from(currentState.ordersList);
      ordersList.add(orderItem);
      emit(OrdersLoaded(ordersList: ordersList));
    } else {
      emit(OrdersLoaded(ordersList: [orderItem]));
    }
  }

  void cancelOrder(OrderItemModel orderItem) {
    final currentState = state;
    if (currentState is OrdersLoaded) {
      final ordersList = List<OrderItemModel>.from(currentState.ordersList);
      ordersList.removeWhere((order) => order.orderID == orderItem.orderID);
      final cancelDate = DateTime.now();
      final canceledOrder = orderItem.copyWith(
          orderCancelledDate: cancelDate, orderState: OrderState.cancelled);
      ordersList.add(canceledOrder);
      emit(OrdersLoaded(ordersList: ordersList));
    }
  }

  void clearOrders() {
    emit(OrdersEmpty());
  }

  @override
  OrdersState? fromJson(Map<String, dynamic> json) {
    final jsonOrdersList = json["ordersList"] as List;
    final ordersList =
        jsonOrdersList.map((order) => OrderItemModel.fromJson(order)).toList();

    if (ordersList.isEmpty) {
      return OrdersEmpty();
    } else {
      return OrdersLoaded(ordersList: ordersList);
    }
  }

  @override
  Map<String, dynamic>? toJson(OrdersState state) {
    final currentState = state;
    if (currentState is OrdersLoaded) {
      final ordersList = List<OrderItemModel>.from(currentState.ordersList);
      return {
        "ordersList": ordersList.map((order) => order.toJson()).toList(),
      };
    } else {
      final List<Map<String, dynamic>> emptyList = [];
      return {"ordersList": emptyList};
    }
  }
}
