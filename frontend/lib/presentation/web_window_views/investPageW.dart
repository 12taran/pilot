import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

class InvestWPage extends StatefulWidget {
 InvestWPage({super.key});
   

  @override
  State<InvestWPage> createState() => _InvestWPageState();
 
  
 
  
}

class _InvestWPageState extends State<InvestWPage> {
   PropertyController propertyController = PropertyController();
   @override
  void initState() {
    super.initState();
    propertyController.loadProperties();
    propertyController.filterProperties(
        type: propertyController.selectedType.value,
        location: propertyController.selectedLocation.value);
  }

  @override
  void dispose() {
    super.dispose();
    propertyController.selectedLocation.value = "";
    propertyController.selectedType.value = "";
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Find your favorite property',
             
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 10),
          
          // Beautified property types list using Wrap
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: propertyController.types.map((type) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Obx(() => FilterChip(
                label: Text(type),
                selected: propertyController.selectedType.value == type,
                onSelected: (_) {
                  propertyController.selectedType.value = type;
                  propertyController.filterProperties(
                    type: propertyController.selectedType.value,
                    location: propertyController.selectedLocation.value,
                  );
                },
              )),
        );
      }).toList(),
    ),
  ),
),

// ✅ Reset Filters Button
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: 16, bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          propertyController.selectedType.value = '';
          propertyController.selectedLocation.value = '';
          propertyController.filterProperties(type: '', location: '');
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Reset Filters'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  ],
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
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: propertyController.filteredProperties.length,
                  itemBuilder: (context, index) {
                    return CustomWidgets.propertyCardDesktop(
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
}



        
              
              
          

      
      
  
