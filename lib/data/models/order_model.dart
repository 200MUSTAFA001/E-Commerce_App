import 'cart_item_model.dart';

class OrderModel {
  final String orderID;
  final List<CartItem> orderItems;
  final OrderState orderState;
  final DateTime orderReceivedDate;
  DateTime? orderCancelledDate;
  DateTime? orderDeliveredDate;

  OrderModel({
    required this.orderID,
    required this.orderItems,
    required this.orderState,
    required this.orderReceivedDate,
    this.orderCancelledDate,
    this.orderDeliveredDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderID: json["orderID"],
        orderItems: List<CartItem>.from(
            json["orderItems"].map((element) => CartItem.fromJson(element))),
        orderState: OrderState.values
            .firstWhere((element) => element.name == json["orderState"]),
        orderReceivedDate: DateTime.parse(json["orderReceivedDate"]),
        orderCancelledDate: json["orderCancelledDate"] != null
            ? DateTime.parse(json["orderCancelledDate"])
            : null,
        orderDeliveredDate: json["orderDeliveredDate"] != null
            ? DateTime.parse(json["orderDeliveredDate"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "orderID": orderID,
        "orderItems": orderItems.map((element) => element.toJson()).toList(),
        "orderState": orderState.name,
        "orderReceivedDate": orderReceivedDate.toIso8601String(),
        "orderCancelledDate": orderCancelledDate?.toIso8601String(),
        "orderDeliveredDate": orderDeliveredDate?.toIso8601String(),
      };

  OrderModel copyWith({
    String? orderID,
    List<CartItem>? orderItems,
    OrderState? orderState,
    DateTime? orderReceivedDate,
    DateTime? orderCancelledDate,
    DateTime? orderDeliveredDate,
  }) =>
      OrderModel(
        orderID: orderID ?? this.orderID,
        orderItems: orderItems ?? this.orderItems,
        orderState: orderState ?? this.orderState,
        orderReceivedDate: orderReceivedDate ?? this.orderReceivedDate,
        orderCancelledDate: orderCancelledDate ?? this.orderCancelledDate,
        orderDeliveredDate: orderDeliveredDate ?? this.orderDeliveredDate,
      );
}

enum OrderState { received, cancelled, delivered }
