// class MyCategoriesBySectionsScreen extends StatelessWidget {
//   const MyCategoriesBySectionsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox(
//         width: context.width * 1,
//         height: context.height * 1,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: context.width * 0.2,
//               height: context.height * 1,
//               child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) => Icon(Icons.icecream_sharp)
//                       .onlyPadding(right: 0, left: 0, top: 0, bottom: 20)),
//             ),
//             Expanded(
//               child: GridView.builder(
//                 padding: EdgeInsets.only(left: 6, right: 6),
//                 itemCount: electronics.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 4 / 6,
//                   mainAxisSpacing: 0,
//                   crossAxisSpacing: 12,
//                 ),
//                 itemBuilder: (context, index) => SizedBox(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         width: context.width * 0.4,
//                         height: context.height * 0.2,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             electronics[index].categoryImage,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         electronics[index].categoryName,
//                         style: TextStyle(fontSize: 18),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
//
//
//
//
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
//
//
//
//
//
//
//
// import 'package:api_app/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../app_router.dart';
// import '../widgets/cards/category_card.dart';
//
// class AllCategoriesPage extends StatelessWidget {
//   AllCategoriesPage({super.key});
//
//   final List<CategoryItem> categories = [
//     CategoryItem(
//       categoryName: "beauty",
//       categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//     ),
//     CategoryItem(
//       categoryName: "fragrances",
//       categoryImage: SvgPicture.asset("assets/categories_icons/fragrances.svg"),
//     ),
//     CategoryItem(
//       categoryName: "furniture",
//       categoryImage: SvgPicture.asset("assets/categories_icons/furniture.svg"),
//     ),
//     CategoryItem(
//       categoryName: "groceries",
//       categoryImage: SvgPicture.asset("assets/categories_icons/groceries.svg"),
//     ),
//     CategoryItem(
//       categoryName: "home-decoration",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/home-decoration.svg"),
//     ),
//     CategoryItem(
//       categoryName: "kitchen-accessories",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/kitchen-accessories.svg"),
//     ),
//     CategoryItem(
//       categoryName: "laptops",
//       categoryImage: SvgPicture.asset("assets/categories_icons/laptops.svg"),
//     ),
//     CategoryItem(
//       categoryName: "mens-shirts",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/mens-shirts.svg"),
//     ),
//     CategoryItem(
//       categoryName: "mens-shoes",
//       categoryImage: SvgPicture.asset("assets/categories_icons/mens-shoes.svg"),
//     ),
//     CategoryItem(
//       categoryName: "mens-watches",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/mens-watches.svg"),
//     ),
//     CategoryItem(
//       categoryName: "mobile-accessories",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/mobile-accessories.svg"),
//     ),
//     CategoryItem(
//       categoryName: "motorcycle",
//       categoryImage: SvgPicture.asset("assets/categories_icons/motorcycle.svg"),
//     ),
//     CategoryItem(
//       categoryName: "skin-care",
//       categoryImage: SvgPicture.asset("assets/categories_icons/skin-care.svg"),
//     ),
//     CategoryItem(
//       categoryName: "smartphones",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/smartphones.svg"),
//     ),
//     CategoryItem(
//       categoryName: "sports-accessories",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/sports-accessories.svg"),
//     ),
//     CategoryItem(
//       categoryName: "sunglasses",
//       categoryImage: SvgPicture.asset("assets/categories_icons/sunglasses.svg"),
//     ),
//     CategoryItem(
//       categoryName: "tablets",
//       categoryImage: SvgPicture.asset("assets/categories_icons/tablets.svg"),
//     ),
//     CategoryItem(
//       categoryName: "tops",
//       categoryImage: SvgPicture.asset("assets/categories_icons/tops.svg"),
//     ),
//     CategoryItem(
//       categoryName: "vehicle",
//       categoryImage: SvgPicture.asset("assets/categories_icons/vehicle.svg"),
//     ),
//     CategoryItem(
//       categoryName: "womens-bags",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/womens-bags.svg"),
//     ),
//     CategoryItem(
//       categoryName: "womens-dresses",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/womens-dresses.svg"),
//     ),
//     CategoryItem(
//       categoryName: "womens-jewellery",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/womens-jewellery.svg"),
//     ),
//     CategoryItem(
//       categoryName: "womens-shoes",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/womens-shoes.svg"),
//     ),
//     CategoryItem(
//       categoryName: "womens-watches",
//       categoryImage:
//       SvgPicture.asset("assets/categories_icons/womens-watches.svg"),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GridView.builder(
//         itemCount: categories.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 4 / 5,
//         ),
//         itemBuilder: (context, index) => CategoryCard(
//           categoryName: categories[index].categoryName,
//           categoryImage: categories[index].categoryImage,
//           onTap: () {
//             context.push(AppRouter.productsByCategoryPage,
//                 extra: categories[index].categoryName);
//           },
//         ),
//       ).onlyPadding(right: 6, left: 6, top: 0, bottom: 0),
//     );
//   }
// }
//
// class CategoryItem {
//   final String categoryName;
//   final SvgPicture categoryImage;
//
//   CategoryItem({required this.categoryName, required this.categoryImage});
// }
//
// // final List<CategoryItem> categories = [
// //   CategoryItem(
// //     categoryName: "beauty",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "fragrances",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "furniture",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "groceries",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "home-decoration",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "kitchen-accessories",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "laptops",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-shirts",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-shoes",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-watches",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "mobile-accessories",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "motorcycle",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "skin-care",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "smartphones",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "sports-accessories",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "sunglasses",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "tablets",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "tops",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "vehicle",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-bags",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-dresses",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-jewellery",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-shoes",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-watches",
// //     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
// //   ),
// // ];
//
// // final List<CategoryItem> categories = [
// //   CategoryItem(
// //     categoryName: "beauty",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "fragrances",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "furniture",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "groceries",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "home-decoration",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "kitchen-accessories",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "laptops",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-shirts",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-shoes",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "mens-watches",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "mobile-accessories",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "motorcycle",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "skin-care",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "smartphones",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "sports-accessories",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "sunglasses",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "tablets",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "tops",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "vehicle",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-bags",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-dresses",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-jewellery",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-shoes",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// //   CategoryItem(
// //     categoryName: "womens-watches",
// //     categoryIcon: MyFlutterApp.audio,
// //   ),
// // ];
// //
