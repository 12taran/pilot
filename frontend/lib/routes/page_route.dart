import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/authController.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/screens/authScreens/email_password_sign_up.dart';
import 'package:pilot_project/presentation/screens/authScreens/phone_signIn.dart';
import 'package:pilot_project/presentation/screens/authScreens/phone_sign_up.dart';
import 'package:pilot_project/presentation/screens/authScreens/register.dart';
import 'package:pilot_project/presentation/screens/place_location_screen.dart';
import 'package:pilot_project/presentation/screens/user/filter.dart';
import 'package:pilot_project/presentation/screens/user/userDetail.dart';

import 'package:pilot_project/presentation/screens/onboarding/onboarding.dart';

import 'package:pilot_project/presentation/screens/splash.dart';
import 'package:pilot_project/presentation/screens/user/investpage.dart';
import 'package:pilot_project/presentation/screens/user/navigation.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/presentation/screens/user/propertyDetail.dart';

import 'package:pilot_project/presentation/screens/user/setting.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// @author PRINCE DUBEY
/// @email princedubey80066@gmail.com
/// @DATE 11/04/2025
class PageRoutes {
  static const String splashScreen = "/splashScreen";
  static const String phonesignup = "/phoneSignup";
  static const String phonesignin = "/phoneSignin";
  static const String bottomNav = "/bottomNav";
  static const String emailPassword = "/emailPassword";
  static const String invest = "/invest";
  static const String setting = "/setting";
  static const String onboarding = "/onBoarding";
  static const String drawerProfile = "/drawerProfile";
  static const String userDetail = "/userDetail";
  static const String propertydetail = "/propertyDetails";
  static const String register = "/register";
  static const String filterPage = "/filterPage";
  static const String mapPage = "/mapPage";

  // get product category
  static List<GetPage> getPageRoutes() {
    // final globleMiddleware = [GlobalMiddleware()];
    return [
      GetPage(
        name: invest,
        page: () => const Investpage(),
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(() => PropertyController());
        }),
      ),
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: userDetail,
        page: () => const UserDetail(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: phonesignup,
        page: () => const PhoneSignUpScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(() => AuthController());
        }),
      ),
      GetPage(
        name: phonesignin,
        page: () => const PhoneSignInScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(() => AuthController());
        }),
      ),
      GetPage(
        name: bottomNav,
        page: () => const BottomNavScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: emailPassword,
        page: () => const EmailSignUpScreen(),
        transition: Transition.upToDown,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: setting,
        page: () => const Setting(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: drawerProfile,
        page: () => ProfilePage(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: onboarding,
        page: () => const OnboardingScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: register,
        page: () => const RegisterScreen(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: propertydetail,
        page: () => Propertydetail(
          property: Get.arguments as PropertyModel,
        ),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 200),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(
            () => PropertyController(),
          );
        }),
      ),
      GetPage(
        name: filterPage,
        page: () => FilterPage(
          filterKey: Get.arguments['filterKey'],
          filterValue: Get.arguments['filterValue'],
        ),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 200),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(
            () => PropertyController(),
          );
        }),
      ),
      GetPage(
        name: mapPage,
        page: () => PlaceLocationMapScreen(
          latitude: (Get.arguments['latitude'] ?? 0).toDouble(),
          longitude: (Get.arguments['longitude'] ?? 0).toDouble(),
          placeName: Get.arguments['placeName'] ?? '',
        ),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 200),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(
            () => PropertyController(),
          );
        }),
      )
    ];
  }
}
