import 'package:api_app/app_router.dart';
import 'package:api_app/presentation/widgets/cards/category_card.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesGrid extends StatelessWidget {
  CategoriesGrid({super.key});

  final List<CategoryItem> categories = [
    CategoryItem(
      categoryName: "beauty",
      categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
    ),
    CategoryItem(
      categoryName: "fragrances",
      categoryImage: SvgPicture.asset("assets/categories_icons/fragrances.svg"),
    ),
    CategoryItem(
      categoryName: "furniture",
      categoryImage: SvgPicture.asset("assets/categories_icons/furniture.svg"),
    ),
    CategoryItem(
      categoryName: "groceries",
      categoryImage: SvgPicture.asset("assets/categories_icons/groceries.svg"),
    ),
    CategoryItem(
      categoryName: "home-decoration",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/home-decoration.svg"),
    ),
    CategoryItem(
      categoryName: "kitchen-accessories",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/kitchen-accessories.svg"),
    ),
    CategoryItem(
      categoryName: "laptops",
      categoryImage: SvgPicture.asset("assets/categories_icons/laptops.svg"),
    ),
    CategoryItem(
      categoryName: "mens-shirts",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/mens-shirts.svg"),
    ),
    CategoryItem(
      categoryName: "mens-shoes",
      categoryImage: SvgPicture.asset("assets/categories_icons/mens-shoes.svg"),
    ),
    CategoryItem(
      categoryName: "mens-watches",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/mens-watches.svg"),
    ),
    CategoryItem(
      categoryName: "mobile-accessories",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/mobile-accessories.svg"),
    ),
    CategoryItem(
      categoryName: "motorcycle",
      categoryImage: SvgPicture.asset("assets/categories_icons/motorcycle.svg"),
    ),
    CategoryItem(
      categoryName: "skin-care",
      categoryImage: SvgPicture.asset("assets/categories_icons/skin-care.svg"),
    ),
    CategoryItem(
      categoryName: "smartphones",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/smartphones.svg"),
    ),
    CategoryItem(
      categoryName: "sports-accessories",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/sports-accessories.svg"),
    ),
    CategoryItem(
      categoryName: "sunglasses",
      categoryImage: SvgPicture.asset("assets/categories_icons/sunglasses.svg"),
    ),
    CategoryItem(
      categoryName: "tablets",
      categoryImage: SvgPicture.asset("assets/categories_icons/tablets.svg"),
    ),
    CategoryItem(
      categoryName: "tops",
      categoryImage: SvgPicture.asset("assets/categories_icons/tops.svg"),
    ),
    CategoryItem(
      categoryName: "vehicle",
      categoryImage: SvgPicture.asset("assets/categories_icons/vehicle.svg"),
    ),
    CategoryItem(
      categoryName: "womens-bags",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/womens-bags.svg"),
    ),
    CategoryItem(
      categoryName: "womens-dresses",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/womens-dresses.svg"),
    ),
    CategoryItem(
      categoryName: "womens-jewellery",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/womens-jewellery.svg"),
    ),
    CategoryItem(
      categoryName: "womens-shoes",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/womens-shoes.svg"),
    ),
    CategoryItem(
      categoryName: "womens-watches",
      categoryImage:
          SvgPicture.asset("assets/categories_icons/womens-watches.svg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4 / 5,
      ),
      itemBuilder: (context, index) => CategoryCard(
        categoryName: categories[index].categoryName,
        categoryImage: categories[index].categoryImage,
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRouter.productsByCategoryPage,
            arguments: categories[index].categoryName,
          );
        },
      ),
    ).onlyPadding(right: 6, left: 6, top: 0, bottom: 0);
  }
}

// final List<CategoryItem> categories = [
//   CategoryItem(
//     categoryName: "beauty",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "fragrances",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "furniture",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "groceries",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "home-decoration",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "kitchen-accessories",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "laptops",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "mens-shirts",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "mens-shoes",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "mens-watches",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "mobile-accessories",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "motorcycle",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "skin-care",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "smartphones",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "sports-accessories",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "sunglasses",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "tablets",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "tops",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "vehicle",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "womens-bags",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "womens-dresses",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "womens-jewellery",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "womens-shoes",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
//   CategoryItem(
//     categoryName: "womens-watches",
//     categoryImage: SvgPicture.asset("assets/categories_icons/beauty.svg"),
//   ),
// ];

// final List<CategoryItem> categories = [
//   CategoryItem(
//     categoryName: "beauty",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "fragrances",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "furniture",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "groceries",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "home-decoration",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "kitchen-accessories",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "laptops",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "mens-shirts",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "mens-shoes",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "mens-watches",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "mobile-accessories",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "motorcycle",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "skin-care",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "smartphones",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "sports-accessories",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "sunglasses",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "tablets",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "tops",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "vehicle",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "womens-bags",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "womens-dresses",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "womens-jewellery",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "womens-shoes",
//     categoryIcon: MyFlutterApp.audio,
//   ),
//   CategoryItem(
//     categoryName: "womens-watches",
//     categoryIcon: MyFlutterApp.audio,
//   ),
// ];
//

class CategoryItem {
  final String categoryName;
  final SvgPicture categoryImage;

  CategoryItem({required this.categoryName, required this.categoryImage});
}
