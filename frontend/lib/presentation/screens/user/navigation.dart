import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/bottomNavController.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/presentation/screens/admin/addedProperties.dart';
import 'package:pilot_project/presentation/screens/user/home.dart';
import 'package:pilot_project/presentation/screens/user/investpage.dart';
import 'package:pilot_project/presentation/screens/user/portfolio.dart';
import 'package:pilot_project/presentation/screens/user/wishlistPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pilot_project/presentation/utils_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Investpage(),
    const PortfolioPage(),
    Properties()
  ];

  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Wishlist'),
    const BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'Invest'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.work_outline), label: 'Portfolio'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.work_history), label: 'Properties'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  void getUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString(Constants.USER_ID) ?? "";
    Get.find<Usercontroller>().getUserDetails(userId);
  }

  Future<bool> _onWillPop() async {
    if (bottomNavController.currentIndex.value != 0) {
      bottomNavController.currentIndex.value = 0;
      return false;
    } else {
      print('onWillPop called');

      final shouldExit = await UtilsWidget.showConfirmationDialog(
        context: context,
        message: 'You surely want to exit Share Sampatti?',
        onYesPressed: () => Get.back(result: true),
        onNoPressed: () => Get.back(result: false),
      );

      return shouldExit ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevent automatic pop
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final shouldExit = await _onWillPop();
          if (shouldExit) {
            SystemNavigator.pop(); // Or: Navigator.of(context).pop()
          }
        }
      },
      child: Obx(() => Scaffold(
            body: _pages[bottomNavController.currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomNavController.currentIndex.value,
              onTap: bottomNavController.changeTabIndex,
              items: _navItems,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey,
            ),
          )),
    );
  }
}
