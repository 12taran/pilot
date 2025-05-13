import 'package:flutter/material.dart';
import 'package:pilot_project/core/config.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<String> titles = [
    'Home',
    'Wishlist',
    'Invest',
    'Portfolio',
    'Properties'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2B50A2), Color(0xFF13B981)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 8),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/icon/logo.png',
            height: 100,
          ),

          // Navigation Items
          Row(
            children: List.generate(titles.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _NavItem(
                  title: titles[index],
                  isActive: selectedIndex == index,
                  onTap: () => onTabChanged(index),
                ),
              );
            }),
          ),

          // Sign In Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 70,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
