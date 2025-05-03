import 'package:flutter/material.dart';

class BottomNavBarView extends StatelessWidget {
  BottomNavBarView(
      {super.key,
      required this.bottomNavigationBarItems,
      required this.selectedIndex,
      required this.onNavigationItemBarTapped});

  final List<BottomNavigationBarItem> bottomNavigationBarItems;

  final int selectedIndex;

  ValueChanged<int>? onNavigationItemBarTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: selectedIndex,
        onTap: onNavigationItemBarTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
