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

  @override
  void initState() {
    super.initState();
    propertyController.loadProperties();
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
                _showFilterDialog(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: propertyController.types.map((type) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Obx(() => FilterChip(
                            label: Text(type),
                            selected:
                                propertyController.selectedType.value == type,
                            onSelected: (_) {
                              propertyController.selectedType.value = type;
                              propertyController.filterProperties(
                                type: propertyController.selectedType.value,
                                location:
                                    propertyController.selectedLocation.value,
                              );
                            },
                          )),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (propertyController.filteredProperties.isEmpty) {
                  return const Center(
                    child: Center(
                      child: Text(
                        'No properties found.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: propertyController.filteredProperties.length,
                  itemBuilder: (context, index) {
                    return CustomWidgets.propertyCard(
                      propertyController,
                      propertyController.filteredProperties[index],
                      context,
                    );
                  },
                );
              }),
            ),
          ],
        ));
        
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Properties'),
          content: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExpansionTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(
                      propertyController.selectedLocation.value.isEmpty
                          ? 'Location'
                          : propertyController.selectedLocation.value,
                    ),
                    children: propertyController.locations.map((location) {
                      return Obx(() => ListTile(
                            title: Text(
                              location,
                              style: TextStyle(
                                fontWeight:
                                    propertyController.selectedLocation.value ==
                                            location
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              propertyController.selectedLocation.value =
                                  location;
                              propertyController.filterProperties(
                                type: propertyController.selectedType.value,
                                location:
                                    propertyController.selectedLocation.value,
                              );
                              Utils.showToast(
                                  message: "Location '$location' selected");
                            },
                          ));
                    }).toList(),
                  ),
                ],
              )),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
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
