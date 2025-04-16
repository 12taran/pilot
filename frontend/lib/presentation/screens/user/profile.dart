import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/page_route.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.05,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: Get.width,
            height: Get.height * 0.12,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
                Text(
                  'Prince Dubey',
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: Constants.fontSizeHeading,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.toNamed(PageRoutes.setting);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAndToNamed(PageRoutes.phonesignup);
            },
          ),
        ],
      ),
    );
  }
}
