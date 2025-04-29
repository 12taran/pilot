import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/routes/page_route.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  // Observable for connection status (initially none)
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Getter to access connection status outside the controller
  ConnectivityResult get connectionStatus => _connectionStatus.value;

  @override
  @override
  void onInit() {
    super.onInit();
    _initConnectivity();
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first);
      }
    });
  }

  // Initialize connectivity status at startup
  Future<void> _initConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      if (results.isNotEmpty) {
        _updateConnectionStatus(results.first);
      }
    } catch (e) {
      log('Could not check connectivity status: $e');
    }
  }

  // Update connection status and handle navigation
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    _connectionStatus.value = connectivityResult;

    if (connectivityResult == ConnectivityResult.none) {
      Utils.showToast(message: "No internet connection");
      _navigateToNoInternetScreen();
    } else {
      _handleConnectionRestored();
    }
  }

  void _navigateToNoInternetScreen() {
    // Prevent multiple instances of the same screen
    if (Get.currentRoute != PageRoutes.noInternet) {
      Get.offAllNamed(PageRoutes.noInternet);
    }
  }

  void _handleConnectionRestored() {
    log("Internet connection restored, navigating to Splash Screen");

    // Prevent unnecessary navigation if already on splash screen or home
    if (Get.currentRoute != PageRoutes.splashScreen &&
        Get.currentRoute != PageRoutes.bottomNav) {
      Get.offAllNamed(PageRoutes.splashScreen);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
