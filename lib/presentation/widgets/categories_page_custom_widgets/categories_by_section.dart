import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_router.dart';
import '../../../data/models/category_item_model.dart';

class CategoriesBySection extends StatelessWidget {
  CategoriesBySection({super.key, required this.selectedIndex});

  final List<CategoryItem> beauty = [
    CategoryItem(
      categoryTitle: "Makeup",
      categoryName: "beauty",
      categoryImage: "assets/categories_icons/beauty.webp",
    ),
    CategoryItem(
      categoryTitle: "Fragrances",
      categoryName: "fragrances",
      categoryImage: "assets/categories_icons/fragrances.webp",
    ),
    CategoryItem(
      categoryTitle: "Skin care",
      categoryName: "skin-care",
      categoryImage: "assets/categories_icons/skin-care.webp",
    ),
  ];
  //
  final List<CategoryItem> vehicle = [
    CategoryItem(
      categoryTitle: "Cars",
      categoryName: "vehicle",
      categoryImage: "assets/categories_icons/vehicle.webp",
    ),
    CategoryItem(
      categoryTitle: "Motorcycle",
      categoryName: "motorcycle",
      categoryImage: "assets/categories_icons/motorcycle.webp",
    ),
  ];
  //
  final List<CategoryItem> fashion = [
    CategoryItem(
      categoryTitle: "Shirts",
      categoryName: "mens-shirts",
      categoryImage: "assets/categories_icons/mens-shirts.webp",
    ),
    CategoryItem(
      categoryTitle: "Shoes",
      categoryName: "mens-shoes",
      categoryImage: "assets/categories_icons/mens-shoes.webp",
    ),
    CategoryItem(
      categoryTitle: "Watches",
      categoryName: "mens-watches",
      categoryImage: "assets/categories_icons/mens-watches.webp",
    ),
    CategoryItem(
      categoryTitle: "Women's bags",
      categoryName: "womens-bags",
      categoryImage: "assets/categories_icons/women-bags.webp",
    ),
    CategoryItem(
      categoryTitle: "Dresses",
      categoryName: "womens-dresses",
      categoryImage: "assets/categories_icons/women-dresses.webp",
    ),
    CategoryItem(
      categoryTitle: "Jewellery",
      categoryName: "womens-jewellery",
      categoryImage: "assets/categories_icons/women-jewellery.webp",
    ),
    CategoryItem(
      categoryTitle: "Women's shoes",
      categoryName: "womens-shoes",
      categoryImage: "assets/categories_icons/women-shoes.webp",
    ),
    CategoryItem(
      categoryTitle: "Women's watches",
      categoryName: "womens-watches",
      categoryImage: "assets/categories_icons/women-watches.webp",
    ),
    CategoryItem(
      categoryTitle: "Women's tops",
      categoryName: "tops",
      categoryImage: "assets/categories_icons/women-tops.webp",
    ),
    CategoryItem(
      categoryTitle: "Sunglasses",
      categoryName: "sunglasses",
      categoryImage: "assets/categories_icons/sunglasses.webp",
    ),
  ];
  //
  final List<CategoryItem> electronics = [
    CategoryItem(
      categoryTitle: "Laptops",
      categoryName: "laptops",
      categoryImage: "assets/categories_icons/laptops.webp",
    ),
    CategoryItem(
      categoryTitle: "Mobile accessories",
      categoryName: "mobile-accessories",
      categoryImage: "assets/categories_icons/mobile-accessories.webp",
    ),
    CategoryItem(
      categoryTitle: "Smartphones",
      categoryName: "smartphones",
      categoryImage: "assets/categories_icons/smartphones.webp",
    ),
    CategoryItem(
      categoryTitle: "Tablets",
      categoryName: "tablets",
      categoryImage: "assets/categories_icons/tablets.webp",
    ),
  ];
  //
  final List<CategoryItem> home = [
    CategoryItem(
      categoryTitle: "Kitchen accessories",
      categoryName: "kitchen-accessories",
      categoryImage: "assets/categories_icons/kitchen-accessories.webp",
    ),
    CategoryItem(
      categoryTitle: "Home decoration",
      categoryName: "home-decoration",
      categoryImage: "assets/categories_icons/home-decoration.webp",
    ),
    CategoryItem(
      categoryTitle: "Furniture",
      categoryName: "furniture",
      categoryImage: "assets/categories_icons/furniture.webp",
    ),
  ];
  //
  final List<CategoryItem> groceries = [
    CategoryItem(
      categoryTitle: "Groceries",
      categoryName: "groceries",
      categoryImage: "assets/categories_icons/groceries.webp",
    ),
  ];
  //
  final List<CategoryItem> sportsAccessories = [
    CategoryItem(
      categoryTitle: "Sports accessories",
      categoryName: "sports-accessories",
      categoryImage: "assets/categories_icons/sports-accessories.webp",
    ),
  ];
  //
  List<CategoryItem> categoriesListBySection(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return fashion;
      case 1:
        return electronics;
      case 2:
        return home;
      case 3:
        return beauty;
      case 4:
        return vehicle;
      case 5:
        return sportsAccessories;
      case 6:
        return groceries;
      default:
        return [];
    }
  }

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categoriesListBySection(selectedIndex).length,
        itemBuilder: (context, index) {
          final categoryItem = categoriesListBySection(selectedIndex)[index];
          return GestureDetector(
            onTap: () {
              context.push(
                AppRouter.productsByCategoryPage,
                extra: categoryItem,
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      categoriesListBySection(selectedIndex)[index]
                          .categoryImage,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  categoriesListBySection(selectedIndex)[index].categoryTitle,
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
