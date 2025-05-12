import 'package:flutter/material.dart';
import 'package:pilot_project/presentation/web_window_views/homeW.dart';
import 'package:pilot_project/presentation/web_window_views/investPageW.dart';
import 'package:pilot_project/presentation/web_window_views/navbar.dart';
import 'package:pilot_project/presentation/web_window_views/portfolioW.dart';
import 'package:pilot_project/presentation/web_window_views/propertiesW.dart';
import 'package:pilot_project/presentation/web_window_views/wishListW.dart';
// Assuming this is your HomePage

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Homew(),
    Wishlistw(),
    InvestWPage(),
    Portfoliow(),
    Propertiesw(), // Assuming this is the correct widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomNavbar(
            selectedIndex: selectedIndex,
            onTabChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }
}
