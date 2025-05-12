import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pilot_project/core/app_theme.dart';
import 'package:pilot_project/dependency_injection.dart';
import 'package:pilot_project/presentation/controllers/boardmember_controller.dart';
import 'package:pilot_project/presentation/controllers/help_and_supportController.dart';
import 'package:pilot_project/presentation/controllers/no_internet_controller.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/controllers/theme_controller.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/routes/page_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  DependencyInjection.init();
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Usercontroller());
    Get.put(HelpAndSupportController());
    Get.put(BoardMemberController());
    Get.put(PropertyController());
    Get.put(Usercontroller());
      }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final NetworkController connectivityController = Get.put(NetworkController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    print(
        'Platform.isAndroid: ${Platform.isAndroid}, Platform.isIOS: ${Platform.isIOS}');

    return ScreenUtilInit(
      child: GetMaterialApp(
        initialBinding: InitialBinding(),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.theme,
        getPages: PageRoutes.getPageRoutes(),
        debugShowCheckedModeBanner: false,
        initialRoute: Platform.isAndroid || Platform.isIOS
            ? PageRoutes.splashScreen
            : PageRoutes.homeScreen,
      ),
    );
  }
}
