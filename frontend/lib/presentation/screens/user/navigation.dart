import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/screens/user/home.dart';
import 'package:pilot_project/presentation/screens/user/portfolio.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/presentation/screens/user/wishlistPage.dart';
import 'package:pilot_project/routes/page_route.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const WishlistPage(),
    const PortfolioPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Wishlist'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.work_outline), label: 'Portfolio'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        width: Get.width,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: Get.height * 0.2,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 3; // Profile index
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                          width: Get.width * 0.15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          child: Image.asset(
                            "assets/images/onboarding1.png",
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Prince Dubey',
                        style: GoogleFonts.acme(
                            color: Colors.white,
                            fontSize: Constants.fontSizeHeading),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(PageRoutes.setting);
                // Navigate to a Settings page if available
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _navItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
