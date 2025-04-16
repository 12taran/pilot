import 'package:get/get.dart';
import 'package:pilot_project/presentation/controllers/authController.dart';
import 'package:pilot_project/presentation/screens/email_password_sign_up.dart';
import 'package:pilot_project/presentation/screens/onboarding/onboarding.dart';
import 'package:pilot_project/presentation/screens/phone_sign_up.dart';
import 'package:pilot_project/presentation/screens/splash.dart';
import 'package:pilot_project/presentation/screens/user/navigation.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/presentation/screens/user/setting.dart';
import 'package:pilot_project/presentation/screens/user/userDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @author PRINCE DUBEY
/// @email princedubey80066@gmail.com
/// @DATE 11/04/2025
class PageRoutes {
  static const String splashScreen = "/splashScreen";
  static const String phonesignup = "/phoneSignup";
  static const String bottomNav = "/bottomNav";
  static const String emailPassword = "/emailPassword";
  static const String setting = "/setting";
  static const String onboarding = "/onBoarding";
  static const String drawerProfile = "/drawerProfile";
   static const String userDetail = "/userDetail";

  // get product category
  static List<GetPage> getPageRoutes() {
    // final globleMiddleware = [GlobalMiddleware()];
    return [
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: userDetail,
        page: () => const UserDetail(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: phonesignup,
        page: () => const PhoneSignUpScreen(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
          Get.lazyPut(() => AuthController());
        }),
      ),
      GetPage(
        name: bottomNav,
        page: () => const BottomNavScreen(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: emailPassword,
        page: () => const EmailSignUpScreen(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: setting,
        page: () => const Setting(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: drawerProfile,
        page: () => const ProfilePage(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
      GetPage(
        name: onboarding,
        page: () => const OnboardingScreen(),
        binding: BindingsBuilder(() async {
          final sharedPreferences = await SharedPreferences.getInstance();
          Get.put(() => sharedPreferences, permanent: true);
        }),
      ),
    ];
  }
}
