import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/data/repos/property_repo.dart';
// make sure you import it

class PropertyController extends GetxController {
  RxList<PropertyModel> properties = <PropertyModel>[].obs;
  RxList<PropertyModel> filteredProperties =
      <PropertyModel>[].obs; // For filtered results
  RxList<PropertyModel> isFav = <PropertyModel>[].obs;

  RxList<String> types =
      ["Residential", "Commercial", "Holiday Homes"].obs; // Available types
  List<String> locations = [
    "Ahmedabad",
    "GIFT City",
    "Vadodara",
    "Surat",
    "Sanand",
    "Gandhinagar",
    "Mohali",
    "Dholera",
    "Himachal"
  ]; // Available locations
  RxString selectedType = "".obs;
  RxString selectedLocation = "".obs;
  @override
  void onInit() {
    super.onInit();
    loadProperties();
    filteredProperties.value = properties; // Initialize filtered properties
  }

  void loadProperties() async{
    List<PropertyModel> response = await PropertyRepo().getProperties();
    properties.value = response; // Initialize filtered properties
  }

  // Filter by Type
  // Filter by Type
  void filterProperties({String? type, String? location}) {
    filteredProperties.value = properties.where((p) {
      final matchesType = type == null || type.isEmpty || p.type == type;
      final matchesLocation =
          location == null || location.isEmpty || p.address == location;

      return matchesType && matchesLocation;
    }).toList();
  }

  // Reset Filters
  void resetFilters() {
    selectedType.value = "";
    selectedLocation.value = "";
    filteredProperties.value = List.from(properties);
  }

  final RxList<String> selectedFilters = <String>[].obs;

  void addFilter(String filter) {
    if (!selectedFilters.contains(filter)) {
      selectedFilters.add(filter);
    }
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }
}
