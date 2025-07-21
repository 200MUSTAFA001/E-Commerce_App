// class OnSaleGrid extends StatefulWidget {
//   const OnSaleGrid({
//     super.key,
//     required this.products,
//   });
//
//   final List<Product> products;
//
//   @override
//   State<OnSaleGrid> createState() => _OnSaleGridState();
// }
//
// class _OnSaleGridState extends State<OnSaleGrid> {
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.builder(
//       itemCount: widget.products.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 0,
//         childAspectRatio: 6 / 10,
//       ),
//       itemBuilder: (BuildContext context, int index) => ProductCard(
//         isFavoriteIcon: (widget.products[index].isFavorite)
//             ? const Icon(
//                 CupertinoIcons.heart_fill,
//                 color: Colors.red,
//               )
//             : const Icon(CupertinoIcons.suit_heart),
//         productName: widget.products[index].title,
//         productPrice: widget.products[index].price,
//         productImage: widget.products[index].images.first,
//         productPriceDiscount: widget.products[index].discountPercentage,
//         onTap: () {
//           setState(() {
//             widget.products[index].isFavorite =
//                 !widget.products[index].isFavorite;
//           });
//         },
//         productRating: widget.products[index].rating,
//       ),
//     );
//   }
// }

//   onTap: () {
//     setState(() {
//       widget.products[index].isFavorite =
//           !widget.products[index].isFavorite;
//     });
//   },
//   isFavoriteIcon: (widget.products[index].isFavorite)
//       ? const Icon(
//           CupertinoIcons.heart_fill,
//           color: Colors.red,
//         )
//       : const Icon(CupertinoIcons.suit_heart),
