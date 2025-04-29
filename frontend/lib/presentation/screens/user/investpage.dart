

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

class Investpage extends StatefulWidget {
  Investpage({super.key});

  @override
  State<Investpage> createState() => _InvestpageState();
}

class _InvestpageState extends State<Investpage> {
  final PropertyController propertyController = Get.put(PropertyController());
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    //super.initState();
    propertyController.loadProperties(); // Load properties when the widget is initialized
  }

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
      body: Obx(() {
        if (propertyController.filteredProperties.isEmpty) {
          return const Center(child: Text('No properties found.'));
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:MyTextField(
  controller: searchController,
   trailing: searchController.text.isNotEmpty
      ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchController.clear();
            propertyController.resetFilters(); // Reset full list
          },
        )
      : null,
  
  prefixIcon: IconButton(
    icon: Icon(
      Icons.filter_list_alt,
      color: Theme.of(context).colorScheme.primary,
    ),
    onPressed: () {
      _showFilterDialog(context);
    },
  ),
  width: Get.width * 0.9,
  isLabelEnabled: false,
  labelText: "Search By Name",
  onChanged: (value) {
   // propertyController.searchProperties(value!);
  },
),

              ),
              Expanded(
                child: ListView.builder(
                  itemCount: propertyController.filteredProperties.length,
                  itemBuilder: (context, index) {
                    return CustomWidgets.propertyCard(
                      propertyController,
                      propertyController.filteredProperties[index],
                      context,
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }

 void _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Select Filter Type'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpansionTile(
                leading: const Icon(Icons.category),
                title: const Text('Type'),
                children: propertyController.types.map((type) {
                  return ListTile(
                    title: Text(type),
                    onTap: () {
                      Get.back();
                      searchController.text = "Type: $type"; // ✅ Set selected type
                      propertyController.filterByType(type);
                      Utils.showToast(message: "Type '$type' selected");
                    },
                  );
                }).toList(),
              ),
              ExpansionTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                children: propertyController.locations.map((location) {
                  return ListTile(
                    title: Text(location),
                    onTap: () {
                      Get.back();
                      searchController.text = "Location: $location"; // ✅ Set selected location
                      propertyController.filterByLocation(location);
                      Utils.showToast(message: "Location '$location' selected");
                    },
                  );
                }).toList(),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text('Reset Filters'),
                onTap: () {
                  Get.back();
                  searchController.clear(); // ✅ Clear the field
                  propertyController.resetFilters();
                  Utils.showToast(message: "Filters reset");
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
  @override
  void dispose() {
    searchController.dispose(); // Dispose of the controller when the widget is removed from the widget tree
    super.dispose();
  }
}
