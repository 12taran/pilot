

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
  final PropertyController propertyController = Get.put(PropertyController());
  final TextEditingController searchController = TextEditingController();

  String? selectedType;
  String? selectedLocation;

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
            icon: const Icon(Icons.location_on, color: Colors.white),
            onPressed: () {
              _showFilterDialog(context); // Show filter dialog
            },
          ),
        ],
      ),
      body: Obx(() {
        if (propertyController.filteredProperties.isEmpty) {
          return  Center(
            child: Column(
              children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Type Filters
                      ...propertyController.types.map((type) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(type),
                            selected: selectedType == type,
                            onSelected: (_) {
                              setState(() {
                                selectedType = type;
                                propertyController.filterProperties(type:selectedType,location: selectedLocation);
                              });
                            },
                          ),
                        );
                      }).toList(),]))),
                      
                    Text(
                      'No properties found.',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                                  ],)
                                  );

                
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Type Filters
                      ...propertyController.types.map((type) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(type),
                            selected: selectedType == type,
                            onSelected: (_) {
                              setState(() {
                                selectedType = type;
                                propertyController.filterProperties(type:selectedType,location: selectedLocation);
                              });
                            },
                          ),
                        );
                      }).toList(),
                      // Location Filters
                      /*...propertyController.locations.map((location) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(location),
                            selected: selectedLocation == location,
                            onSelected: (_) {
                              setState(() {
                                selectedLocation = location;
                                propertyController.filterByLocation(location);
                              });
                            },
                          ),
                        );
                      }).toList(),*/
                    ],
                  ),
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
              title: selectedLocation == null ? Text('Location') : Text(selectedLocation!),
                children: propertyController.locations.map((location) {
                  return ListTile(
                    title: Text(location),
                    onTap: () {
                      Get.back();
                      setState(() {
                        selectedLocation = location;
                      });
                   propertyController.filterProperties(type:selectedType,location: selectedLocation);
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
                setState(() {
                  selectedType = null;
                  selectedLocation = null;
                });
                propertyController.resetFilters();
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