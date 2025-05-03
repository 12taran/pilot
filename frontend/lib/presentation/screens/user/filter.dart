import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({
    Key? key,
    required this.filterKey,
    required this.filterValue,
  }) : super(key: key);

  final String filterKey;
  final String filterValue;

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late String selectedFilterValue; // local state
  PropertyController propertyController = Get.find<PropertyController>();

  @override
  void initState() {
    super.initState();
    selectedFilterValue = widget.filterValue; // Use widget.filterValue
  }

  @override
  Widget build(BuildContext context) {
    List<PropertyModel> properties = propertyController.properties;

    // Get unique filter options based on the filterKey
    List<dynamic> filterOptions = properties
        .map((e) {
          switch (widget.filterKey) {
            case 'location':
              return e.address;
            case 'type':
              return e.type;
           
            default:
              return '';
          }
        })
        .toSet()
        .toList()
      ..removeWhere((element) => element.isEmpty);

    // Filter properties based on selected filter value
    List<PropertyModel> filteredProperties = properties.where((property) {
      switch (widget.filterKey) {
        case 'location':
          return property.address == selectedFilterValue;
        case 'type':
          return property.type == selectedFilterValue;
       
        default:
          return false;
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Properties'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filterOptions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilterValue = filterOptions[index];
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: selectedFilterValue == filterOptions[index]
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        filterOptions[index],
                        style: TextStyle(
                          color: selectedFilterValue == filterOptions[index]
                              ? Colors.white
                              : Colors.black,
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
              itemCount: filteredProperties.length,
              itemBuilder: (context, index) {
                var property = filteredProperties[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    leading: Image.asset(
                      property.images[0],
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(property.projectName),
                    subtitle: Text('${property.address} - ₹${property.price}'),
                    onTap: () {
                      // Navigate to property detail if needed
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
