import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';
import '../../data/models/category_item_model.dart';
import '../widgets/lists/sections_list.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({super.key});

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  final List<CategoryItem> beauty = [
    CategoryItem(
      categoryName: "beauty",
      categoryImage: "assets/categories_icons/beauty.webp",
    ),
    CategoryItem(
      categoryName: "fragrances",
      categoryImage: "assets/categories_icons/fragrances.webp",
    ),
    CategoryItem(
      categoryName: "skin-care",
      categoryImage: "assets/categories_icons/skin-care.webp",
    ),
  ];
  //
  final List<CategoryItem> vehicle = [
    CategoryItem(
      categoryName: "vehicle",
      categoryImage: "assets/categories_icons/vehicle.webp",
    ),
    CategoryItem(
      categoryName: "motorcycle",
      categoryImage: "assets/categories_icons/motorcycle.webp",
    ),
  ];
  //
  final List<CategoryItem> fashion = [
    CategoryItem(
      categoryName: "mens-shirts",
      categoryImage: "assets/categories_icons/mens-shirts.webp",
    ),
    CategoryItem(
      categoryName: "mens-shoes",
      categoryImage: "assets/categories_icons/mens-shoes.webp",
    ),
    CategoryItem(
      categoryName: "mens-watches",
      categoryImage: "assets/categories_icons/mens-watches.webp",
    ),
    CategoryItem(
      categoryName: "womens-bags",
      categoryImage: "assets/categories_icons/women-bags.webp",
    ),
    CategoryItem(
      categoryName: "womens-dresses",
      categoryImage: "assets/categories_icons/women-dresses.webp",
    ),
    CategoryItem(
      categoryName: "womens-jewellery",
      categoryImage: "assets/categories_icons/women-jewellery.webp",
    ),
    CategoryItem(
      categoryName: "womens-shoes",
      categoryImage: "assets/categories_icons/women-shoes.webp",
    ),
    CategoryItem(
      categoryName: "womens-watches",
      categoryImage: "assets/categories_icons/women-watches.webp",
    ),
    CategoryItem(
      categoryName: "tops",
      categoryImage: "assets/categories_icons/women-tops.webp",
    ),
    CategoryItem(
      categoryName: "sunglasses",
      categoryImage: "assets/categories_icons/sunglasses.webp",
    ),
  ];
  //
  final List<CategoryItem> electronics = [
    CategoryItem(
      categoryName: "laptops",
      categoryImage: "assets/categories_icons/laptops.webp",
    ),
    CategoryItem(
      categoryName: "mobile-accessories",
      categoryImage: "assets/categories_icons/mobile-accessories.webp",
    ),
    CategoryItem(
      categoryName: "smartphones",
      categoryImage: "assets/categories_icons/smartphones.webp",
    ),
    CategoryItem(
      categoryName: "tablets",
      categoryImage: "assets/categories_icons/tablets.webp",
    ),
  ];
  //
  final List<CategoryItem> home = [
    CategoryItem(
      categoryName: "kitchen-accessories",
      categoryImage: "assets/categories_icons/kitchen-accessories.webp",
    ),
    CategoryItem(
      categoryName: "home-decoration",
      categoryImage: "assets/categories_icons/home-decoration.webp",
    ),
    CategoryItem(
      categoryName: "furniture",
      categoryImage: "assets/categories_icons/furniture.webp",
    ),
  ];
  //
  final List<CategoryItem> groceries = [
    CategoryItem(
      categoryName: "groceries",
      categoryImage: "assets/categories_icons/groceries.webp",
    ),
  ];
  //
  final List<CategoryItem> sportsAccessories = [
    CategoryItem(
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

  //
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          SectionsList(selectedIndex: (value) {
            setState(() {
              selectedIndex = value;
            });
          }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categoriesListBySection(selectedIndex).length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(AppRouter.productsByCategoryPage,
                          extra: categoriesListBySection(selectedIndex)[index]
                              .categoryName);
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
                          categoriesListBySection(selectedIndex)[index]
                              .categoryName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
