import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/add_property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';
import 'package:pilot_project/routes/page_route.dart';

class Properties extends StatefulWidget {
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  AdminPropertyController adminPropertyController =
      Get.put(AdminPropertyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adminPropertyController.getAdiminProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Added Properties",
          style: GoogleFonts.aleo(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: Constants.fontSizeHeading + 2,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 147, 127),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor:Color.fromARGB(255, 86, 147, 127),
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
      body: Obx(() {
        if (adminPropertyController.adminProperties.isEmpty) {
          return const Center(
            child: Center(
              child: Text(
                'No properties found.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: adminPropertyController.adminProperties.length,
          itemBuilder: (context, index) {
            return CustomWidgets.propertyCardAdmin(
              adminPropertyController.adminProperties[index],
              context,
            );
          },
        );
      }),
    );
  }
}
