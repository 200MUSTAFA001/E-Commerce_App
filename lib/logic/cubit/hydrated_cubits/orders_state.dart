part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final List<OrderModel> ordersList;

  OrdersLoaded({required this.ordersList});
}

final class OrdersEmpty extends OrdersState {}

final class OrdersError extends OrdersState {}
