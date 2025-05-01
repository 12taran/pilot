import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/page_route.dart';

class Properties extends StatefulWidget {
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        extendedPadding: EdgeInsets.all(5),
        onPressed: () {
          Get.toNamed(PageRoutes.addProperty);
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
        label: Text(
          "Add Property",
          style: GoogleFonts.almarai(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: Constants.fontSizeSmall + 2,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
