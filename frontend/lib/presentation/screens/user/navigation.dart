import 'package:flutter/material.dart';
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
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
     WishlistPage(),
    const Investpage(),
    const PortfolioPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _navItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _currentIndex == 1
            ? Colors.red
            : Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
