import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/presentation/controllers/bottomNavController.dart';
import 'package:pilot_project/presentation/screens/user/home.dart';
import 'package:pilot_project/presentation/screens/user/investpage.dart';
import 'package:pilot_project/presentation/screens/user/portfolio.dart';
import 'package:pilot_project/presentation/screens/user/wishlistPage.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final List<Widget> _pages = [
    HomePage(),
    WishlistPage(),
    const Investpage(),
    const PortfolioPage(),
  ];

  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Wishlist'),
    const BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Invest'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.work_outline), label: 'Portfolio'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[bottomNavController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavController.currentIndex.value,
            onTap: bottomNavController.changeTabIndex,
            items: _navItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: bottomNavController.currentIndex == 1
                ? Colors.red
                : Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
          ),
        ));
  }
}
