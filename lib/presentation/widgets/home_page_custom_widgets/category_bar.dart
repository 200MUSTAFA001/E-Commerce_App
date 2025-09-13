// Flutter imports:
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key, required this.onCategorySelected});
  final void Function(String category) onCategorySelected;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedIndex = 0;
  String selectedCategory = "";

  final List<IconData> icons = [
    FontAwesomeIcons.shirt,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.couch,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.mobile,
    FontAwesomeIcons.spa,
  ];

  String category(int index) {
    switch (index) {
      case 0:
        return "mens-shirts";
      case 1:
        return "laptops";
      case 2:
        return "furniture";
      case 3:
        return "kitchen-accessories";
      case 4:
        return "smartphones";
      case 5:
        return "beauty";
      default:
        return "mens-shirts";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                selectedCategory = category(index);
                widget.onCategorySelected(selectedCategory);
              });
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.orange.shade700 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.grey,
                size: 28,
              ),
            ).paddingOnly(right: 20),
          );
        },
      ),
    );
  }
}
