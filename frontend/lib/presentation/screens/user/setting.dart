import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/presentation/controllers/theme_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Setting',
          style: GoogleFonts.acme(
              textStyle: Theme.of(context).appBarTheme.titleTextStyle),
        ),
      ),
      body: ListTile(
        leading: const Icon(Icons.brightness_6),
        title: const Text("Dark Mode"),
        trailing: Obx(() => Switch(
              value: Get.find<ThemeController>().isDarkMode.value,
              onChanged: (val) {
                Get.find<ThemeController>().toggleTheme();
              },
            )),
      ),
    );
  }
}
