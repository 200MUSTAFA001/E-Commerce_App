import 'package:e_commerce_app/data/models/checkout_details_model.dart';

class OrderItemModel {
  final String orderID;
  final OrderState orderState;
  final DateTime orderReceivedDate;
  DateTime? orderCancelledDate;
  DateTime? orderDeliveredDate;
  final CheckoutDetailsModel orderDetails;

  OrderItemModel({
    required this.orderID,
    required this.orderState,
    required this.orderReceivedDate,
    this.orderCancelledDate,
    this.orderDeliveredDate,
    required this.orderDetails,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
      orderID: json["orderID"],
      orderState: OrderState.values
          .firstWhere((element) => element.name == json["orderState"]),
      orderReceivedDate: DateTime.parse(json["orderReceivedDate"]),
      orderCancelledDate: json["orderCancelledDate"] != null
          ? DateTime.parse(json["orderCancelledDate"])
          : null,
      orderDeliveredDate: json["orderDeliveredDate"] != null
          ? DateTime.parse(json["orderDeliveredDate"])
          : null,
      orderDetails: CheckoutDetailsModel.fromJson(json["orderDetails"]));

  Map<String, dynamic> toJson() => {
        "orderID": orderID,
        "orderState": orderState.name,
        "orderReceivedDate": orderReceivedDate.toIso8601String(),
        "orderCancelledDate": orderCancelledDate?.toIso8601String(),
        "orderDeliveredDate": orderDeliveredDate?.toIso8601String(),
        "orderDetails": orderDetails.toJson()
      };

  OrderItemModel copyWith({
    String? orderID,
    OrderState? orderState,
    DateTime? orderReceivedDate,
    DateTime? orderCancelledDate,
    DateTime? orderDeliveredDate,
    CheckoutDetailsModel? orderDetails,
  }) =>
      OrderItemModel(
        orderID: orderID ?? this.orderID,
        orderState: orderState ?? this.orderState,
        orderReceivedDate: orderReceivedDate ?? this.orderReceivedDate,
        orderCancelledDate: orderCancelledDate ?? this.orderCancelledDate,
        orderDeliveredDate: orderDeliveredDate ?? this.orderDeliveredDate,
        orderDetails: orderDetails ?? this.orderDetails,
      );
}

enum OrderState { received, cancelled, delivered }
