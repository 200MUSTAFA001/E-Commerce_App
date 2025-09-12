class CartToCheckoutModel {
  final double subtotal;
  final double discounts;
  final double shippingFee;
  final double total;
  final String shippingAddress;
  final String paymentMethod;

  CartToCheckoutModel({
    required this.subtotal,
    required this.discounts,
    required this.shippingFee,
    required this.total,
    required this.shippingAddress,
    required this.paymentMethod,
  });
}
