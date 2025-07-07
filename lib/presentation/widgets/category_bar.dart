import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    CupertinoIcons.game_controller_solid,
    Icons.checkroom,
    Icons.shopping_bag,
    Icons.directions_run,
    Icons.fitness_center,
  ];

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
              setState(() => selectedIndex = index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.orange.shade700 : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icons[index],
                  color: isSelected ? Colors.white : Colors.grey,
                  size: 28,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
