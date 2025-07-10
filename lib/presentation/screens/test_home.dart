// import 'package:api_app/logic/cubit/fake_store_products_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../data/models/platzi_Product.dart';
// import '../../data/models/product_model.dart';
// import '../../logic/cubit/platzi_products_cubit.dart';
// import '../widgets/items_grid_view.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Product>? fakeProducts;
//   List<PlatziProduct> platziProducts = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fakeProducts =
//         BlocProvider.of<ProductsCubit>(context).getProductsByCategory("mobile");
//     platziProducts = BlocProvider.of<PlatziProductsCubit>(context)
//         .getPlatziProductsByCategory("shoes");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             BlocBuilder<ProductsCubit, ProductsState>(
//               builder: (context, state) {
//                 if (state is ProductsLoaded) {
//                   fakeProducts = (state).products;
//                   return FakeStoreItemsGrid(
//                     fakeProducts: fakeProducts ?? [],
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//             BlocBuilder<PlatziProductsCubit, PlatziProductsState>(
//               builder: (context, state) {
//                 if (state is PlatziProductsLoaded) {
//                   platziProducts = (state).products;
//                   return PlatziItemsGrid(
//                     platziProducts: platziProducts,
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             // ElevatedButton(
//             //   onPressed: () async {},
//             //   child: Text("data"),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // "https://picsum.photos/200/300?random=${20}" //
