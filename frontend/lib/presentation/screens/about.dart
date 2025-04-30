import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/help_and_supportController.dart';
import 'package:pilot_project/routes/page_route.dart';

 // Replace with the actual import

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final HelpAndSupportController helpAndSupportController =
      Get.put(HelpAndSupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              "Share Sampatti shatters the traditional barriers to real estate investment. "
              "Our platform empowers everyone to become a player, allowing you to invest in valuable properties "
              "with just a tap, for a fraction of the usual cost. We believe real estate wealth creation shouldn't "
              "be limited to the privileged few.\n\n"
              "Join Share Sampatti, invest like a pro, diversify your portfolio, and unlock the potential for long-term growth. "
              "We offer a secure, transparent, and user-friendly experience, so you can invest with confidence and start your journey "
              "to financial freedom today!",
              style: TextStyle(
                fontSize: Constants.fontSizeSmall,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: Get.height*0.1,),

            // Links to Terms and Privacy
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Read Usage Terms & Conditions"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to Terms Page
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Read Privacy Policy"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed(PageRoutes.privacyPage); // Navigate to Privacy Policy Page
                // Navigate to Privacy Policy Page
              },
            ),
            const SizedBox(height: 30),

            // Contact Info and Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icon/logo.png',
                  height:Get.height * 0.15,
                  width: Get.width * 0.2,
                  fit: BoxFit.cover,
                  
                ),
                GestureDetector(
                  onTap: () { helpAndSupportController.makePhoneCall('6006136981');},
                  child: const Text(
                    '+9999999999\nshare@sampatti.com',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'SCO-539, Sector-70, Mohali\nPin No-160070',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
