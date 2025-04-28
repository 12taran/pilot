import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

class Investpage extends StatefulWidget {
  const Investpage({super.key});

  @override
  State<Investpage> createState() => _InvestpageState();
}

class _InvestpageState extends State<Investpage> {
  final PropertyController propertyController = Get.find();
  List<Proper

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invest",
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Obx(() => propertyController.properties.isNotEmpty
    ? Column(
        children: [
         
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyTextField(
  prefixIcon: IconButton(
    icon: Icon(Icons.filter_list_alt, color: Theme.of(context).colorScheme.primary),
    onPressed: () {
      _showFilterDialog(context);
    },
  ),
  width: Get.width * 0.9,
  isLabelEnabled: false,
  labelText: "Search By Name",
  
  onChanged: (value) {
    // implement search/filter logic here
  },
)

          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: propertyController.properties.length,
              itemBuilder: (context, index) {
                return CustomWidgets.propertyCard(
                  propertyController,
                  propertyController.properties[index],
                  context,
                );
              },
            ),
          ),
        ],
      )
    : const SizedBox())

    );
  }

  void _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Select Filter Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Theme Filter
            ExpansionTile(
              leading: Icon(Icons.palette),
              title: Text('Theme'),
              children: propertyController.properties {
                return ListTile(
                  title: Text(theme),
                  onTap: () {
                    Get.back();
                    // Apply the selected theme filter
                    propertyController.filterByTheme(theme);
                    Utils.showToast(message: "Theme '$theme' selected");
                  },
                );
              }).toList(),
            ),
            // Region Filter
            ExpansionTile(
              leading: Icon(Icons.location_on),
              title: Text('Region'),
              children: propertyController.regions.map((region) {
                return ListTile(
                  title: Text(region),
                  onTap: () {
                    Get.back();
                    // Apply the selected region filter
                    propertyController.filterByRegion(region);
                    Utils.showToast(message: "Region '$region' selected");
                  },
                );
              }).toList(),
            ),
          ],
        ),
      );
    },
  );
}

}
