import 'package:ecommerce/constants/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final dynamic Function(int)? onItemTapped;
  final int selectedIndex;
  final bool hasItem;
  const MyBottomNavBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex, required this.hasItem,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      currentIndex: selectedIndex,
      unselectedItemColor: lightGrey,
      selectedItemColor: orange2,
      onTap: onItemTapped,
      items:  <BottomNavigationBarItem>[
       const BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_16_regular), label: ''),
        const BottomNavigationBarItem(
            icon: Icon(FluentIcons.box_16_regular), label: ''),
       const BottomNavigationBarItem(
            icon: Icon(FluentIcons.heart_16_regular), label: ''),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(
                FluentIcons.shopping_bag_16_regular,
              ),
              if (hasItem)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: orange2,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                  ),
                ),
            ],
          ),
          label: '',
        ),
       const BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_16_regular), label: ''),
      ],
    );
  }
}
