// Flutter imports:
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../../data/models/section_item_model.dart';

class SectionsList extends StatefulWidget {
  const SectionsList({super.key, required this.selectedIndex});

  final void Function(int) selectedIndex;

  @override
  State<SectionsList> createState() => _SectionsListState();
}

class _SectionsListState extends State<SectionsList> {
  final List<SectionItem> sections = [
    SectionItem(categoryLabel: "Fashion", categoryIcon: Icons.checkroom),
    SectionItem(categoryLabel: "Electronics", categoryIcon: Icons.computer),
    SectionItem(categoryLabel: "Home", categoryIcon: Icons.home),
    SectionItem(categoryLabel: "Beauty", categoryIcon: Icons.face),
    SectionItem(categoryLabel: "Vehicles", categoryIcon: Icons.directions_car),
    SectionItem(
        categoryLabel: "Sports Accessories",
        categoryIcon: Icons.sports_basketball),
    SectionItem(categoryLabel: "Groceries", categoryIcon: Icons.shopping_bag),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sections.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.selectedIndex(index);
            });
          },
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                ),
                child: Icon(
                  sections[index].categoryIcon,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                sections[index].categoryLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              )
            ],
          ).paddingOnly(right: 10),
        );
      },
    ).paddingOnly(right: 10, left: 10);
  }
}
