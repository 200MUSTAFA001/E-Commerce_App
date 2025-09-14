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
}
