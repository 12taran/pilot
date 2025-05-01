// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/presentation/controllers/theme_controller.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/presentation/utils_widget.dart';
import 'package:pilot_project/routes/api_routes.dart';

import 'package:pilot_project/routes/page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pilot_project/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  Usercontroller usercontroller = Get.find<Usercontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.2,
              color: Theme.of(context).colorScheme.secondary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Container(
                          width: Get.width * 0.2,
                          height: Get.width *
                              0.2, // Ensure height matches width for a perfect circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${ApiRoutes.imageRoutes}${usercontroller.userImageUrl.value}'),
                              fit: BoxFit
                                  .cover, // Ensures the image covers the entire container
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            usercontroller.nameController.text,
                            style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: Constants.fontSizeHeading,
                            ),
                          ),
                          Text(
                            usercontroller.mobileController.text,
                            style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: Constants.fontSizeHeading,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed(PageRoutes.userDetail);
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).colorScheme.primary,
                              )))
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
                leading: const Icon(Icons.brightness_6),
                title: const Text("Dark Mode"),
                trailing: Obx(() => Switch(
                      value: Get.find<ThemeController>().isDarkMode.value,
                      onChanged: (val) {
                        Get.find<ThemeController>().toggleTheme();
                      },
                    ))),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: const Icon(Icons.document_scanner),
              title: const Text('Documents'),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: const Icon(Icons.food_bank_outlined),
              title: const Text('Bank Details'),
              onTap: () {
                Get.toNamed(PageRoutes.bankDetail);
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: const Icon(Icons.person),
              title: const Text(' About Us'),
              onTap: () {
                Get.toNamed(PageRoutes.aboutPage);
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: const Icon(Icons.question_mark),
              title: const Text('FAQs'),
              onTap: () {
                Get.toNamed(PageRoutes.faqs);
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                UtilsWidget.showConfirmationDialog(
                    message: 'Are you sure you want to logout?',
                    onYesPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      await FirebaseAuth.instance.signOut();
                      Get.reset();
                      // Get.find<AuthController>().isOtpSent.value = false;
                      Get.offAndToNamed(PageRoutes.phonesignup);
                    },
                    onNoPressed: () {
                      Get.back();
                    },
                    context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
