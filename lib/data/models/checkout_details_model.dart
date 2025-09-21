import 'package:e_commerce_app/data/models/cart_item_model.dart';

class CheckoutDetailsModel {
  final double subtotal;
  final double discounts;
  final double shippingFee;
  final double total;
  final String shippingAddress;
  final String paymentMethod;
  final List<CartItem> orderProducts;

  CheckoutDetailsModel({
    required this.subtotal,
    required this.discounts,
    required this.shippingFee,
    required this.total,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.orderProducts,
  });

  CheckoutDetailsModel copyWith({
    double? subtotal,
    double? discounts,
    double? shippingFee,
    double? total,
    String? shippingAddress,
    String? paymentMethod,
    List<CartItem>? orderProducts,
  }) =>
      CheckoutDetailsModel(
        subtotal: subtotal ?? this.subtotal,
        discounts: discounts ?? this.discounts,
        shippingFee: shippingFee ?? this.shippingFee,
        total: total ?? this.total,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        orderProducts: orderProducts ?? this.orderProducts,
      );
}
