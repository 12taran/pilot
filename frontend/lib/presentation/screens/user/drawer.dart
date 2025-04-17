import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/widgets/utils_widget.dart';
import 'package:pilot_project/routes/page_route.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key});

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
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Image.asset(
                          "assets/images/onboarding1.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            'Prince Dubey',
                            style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: Constants.fontSizeHeading,
                            ),
                          ),
                          Text(
                            '123456XXXX',
                            style: GoogleFonts.acme(
                              color: Colors.white,
                              fontSize: Constants.fontSizeHeading,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(PageRoutes.drawerProfile);
                          },
                          icon: const Icon(Icons.arrow_right))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.document_scanner),
              title: const Text('Documents'),
              onTap: () {
                Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.monetization_on),
              title: const Text('Virtual Wallet'),
              onTap: () {
              //  Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.food_bank_outlined),
              title: const Text('Bank Details'),
              onTap: () {
             //   Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.person),
              title: const Text(' About Us'),
              onTap: () {
             //   Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.question_mark),
              title: const Text('FAQs'),
              onTap: () {
              //  Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Get.toNamed(PageRoutes.setting);
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_right),
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                UtilsWidget.showConfirmationDialog(
                    message: "Sure want to Logout?",
                    onYesPressed: () async {
                      await FirebaseAuth.instance.signOut();
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
