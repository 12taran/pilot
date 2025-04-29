

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


  
  String? selectedFilterValue; // ✅ Add this line

  

  @override
  void initState() {
    super.initState();
    propertyController.loadProperties(); // Load properties initially
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
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              _showFilterDialog(context); // Show filter dialog
            },
          ),
        ],
      ),
      body: Obx(() {
        if (propertyController.filteredProperties.isEmpty) {
          return const Center(
            child: Text(
              'No properties found.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return  Column(
            children: [
              Container(
  height: 50,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: propertyController.types.length, // Use the correct list
    itemBuilder: (context, index) {
      final filterOption = propertyController.types[index]; // Get the filter option
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedFilterValue = filterOption; // Update the selected filter
            propertyController.filterByType(filterOption); // Apply the filter
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: selectedFilterValue == filterOption
                ? Colors.blue
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              filterOption,
              style: TextStyle(
                color: selectedFilterValue == filterOption
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
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

  // Filter Dialog
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Properties'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Type Filter
          
              // Location Filter
              ExpansionTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                children: propertyController.locations.map((location) {
                  return ListTile(
                    title: Text(location),
                    onTap: () {
                      Get.back();
                      propertyController.filterByLocation(location);
                      Utils.showToast(message: "Location '$location' selected");
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                propertyController.resetFilters();
                setState(() {
            selectedFilterValue =''; // Update the selected filter
           // Apply the filter
          });
                Utils.showToast(message: "Filters reset");
              },
              child: const Text('Reset Filters'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}