import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.bottomNavigationBarItems});

  final int currentIndex;
  final void Function(int) onTap;
  final List<BottomNavigationBarItem> bottomNavigationBarItems;

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      elevation: 20,
      currentIndex: currentIndex,
      onTap: onTap,
      behaviour: SnakeBarBehaviour.floating,
      snakeShape: SnakeShape.circle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16),
      snakeViewColor: Colors.deepOrangeAccent,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(fontSize: 14, color: Colors.black),
      unselectedLabelStyle: const TextStyle(fontSize: 10, color: Colors.black),
      items: bottomNavigationBarItems,
    );
  }
}
