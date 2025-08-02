import 'products_model.dart';

class CartItem {
  final Product product;
  final int productQuantity;

  CartItem({
    required this.product,
    required this.productQuantity,
  });

  CartItem copyWith({
    Product? product,
    int? productQuantity,
  }) =>
      CartItem(
        product: product ?? this.product,
        productQuantity: productQuantity ?? this.productQuantity,
      );

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        product: Product.fromJson(json["product"]),
        productQuantity: json["productQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "productQuantity": productQuantity,
      };
}
