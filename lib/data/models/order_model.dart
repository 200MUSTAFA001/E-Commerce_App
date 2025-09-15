import 'cart_item_model.dart';

class OrderItemModel {
  final String orderID;
  final List<CartItem> orderItems;
  final OrderState orderState;
  final DateTime orderReceivedDate;
  final String shippingAddress;
  DateTime? orderCancelledDate;
  DateTime? orderDeliveredDate;

  OrderItemModel({
    required this.orderID,
    required this.orderItems,
    required this.orderState,
    required this.orderReceivedDate,
    required this.shippingAddress,
    this.orderCancelledDate,
    this.orderDeliveredDate,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        orderID: json["orderID"],
        orderItems: List<CartItem>.from(
            json["orderItems"].map((element) => CartItem.fromJson(element))),
        orderState: OrderState.values
            .firstWhere((element) => element.name == json["orderState"]),
        orderReceivedDate: DateTime.parse(json["orderReceivedDate"]),
        shippingAddress: json["shippingAddress"],
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
        "shippingAddress": shippingAddress,
        "orderCancelledDate": orderCancelledDate?.toIso8601String(),
        "orderDeliveredDate": orderDeliveredDate?.toIso8601String(),
      };

  OrderItemModel copyWith({
    String? orderID,
    List<CartItem>? orderItems,
    OrderState? orderState,
    DateTime? orderReceivedDate,
    String? shippingAddress,
    DateTime? orderCancelledDate,
    DateTime? orderDeliveredDate,
  }) =>
      OrderItemModel(
        orderID: orderID ?? this.orderID,
        orderItems: orderItems ?? this.orderItems,
        orderState: orderState ?? this.orderState,
        orderReceivedDate: orderReceivedDate ?? this.orderReceivedDate,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        orderCancelledDate: orderCancelledDate ?? this.orderCancelledDate,
        orderDeliveredDate: orderDeliveredDate ?? this.orderDeliveredDate,
      );
}

enum OrderState { received, cancelled, delivered }
