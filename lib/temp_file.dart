// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: SD(),
//   ));
// }

// class Temp extends StatelessWidget {
//   const Temp({super.key, required this.image});
//
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       child: InteractiveViewer(
//           child: Hero(tag: "00", child: Image.network(image))),
//     ),);
//   }
// }

// class ProductOnSaleCard extends StatelessWidget {
//   const ProductOnSaleCard({
//     super.key,
//     required this.productName,
//     required this.productPrice,
//     required this.productImage,
//     required this.productPriceDiscount,
//     required this.onTap,
//   });
//
//   final String productName;
//   final double productPrice;
//   final String productImage;
//   final String productPriceDiscount;
//   final void Function() onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         color: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15), color: Colors.white),
//           // width: MediaQuery.of(context).size.width * 0.35,
//           // height: MediaQuery.of(context).size.height * 0.35,
//           child: GridTile(
//             header: Padding(
//               padding: const EdgeInsets.only(top: 10, left: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.favorite_border,
//                         color: Colors.red,
//                       )),
//                 ],
//               ),
//             ),
//             footer: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.black38,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15),
//                 ),
//               ),
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   FittedBox(
//                     fit: BoxFit.contain,
//                     child: Text(
//                       productName,
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                   ),
//                   Text(
//                     r"$ " + productPrice.toStringAsFixed(1),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ).onlyPadding(right: 0, left: 14, top: 4, bottom: 4),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Banner(
//                 location: BannerLocation.topEnd,
//                 message: "$productPriceDiscount % off",
//                 child: CachedNetworkImage(
//                   imageUrl: productImage,
//                   progressIndicatorBuilder: (context, url, downloadProgress) =>
//                       Center(
//                           child: CircularProgressIndicator(
//                               value: downloadProgress.progress)),
//                   errorWidget: (context, url, error) =>
//                       const Center(child: Icon(Icons.error)),
//                   fit: BoxFit.scaleDown,
//                 )
//                 // Image.network(
//                 //   productImage,
//                 //   fit: BoxFit.cover,
//                 //   width: double.infinity,
//                 //   height: double.infinity,
//                 // )
//                 ,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
