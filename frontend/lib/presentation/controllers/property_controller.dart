import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
// make sure you import it

class PropertyController extends GetxController {
  RxList<PropertyModel> properties = <PropertyModel>[].obs;
   RxList<PropertyModel> isFav = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }

  void loadProperties() {
    properties.value = [
      PropertyModel(
        name: "Sunset Heights",
        desc: "Semi Furnished",
        image: "assets/images/property2.jpg",
        location: "Ahmedabad",
        latitude: 23.0225,
        longitude: 72.5714,
        price: "18,50,000",
        type: "Residential",
        description: "Located in a peaceful neighborhood of Ahmedabad, Sunset Heights offers semi-furnished 2BHK apartments with natural lighting, a gym, a clubhouse, and children's play area. Ideal for small families.",
      ),
      PropertyModel(
        name: "Corporate Plaza",
        desc: "Fully Furnished",
        image: "assets/images/property3.jpg",
        location: "GIFT City",
        latitude: 23.1560,
        longitude: 72.6833,
        price: "35,00,000",
        type: "Commercial",
        description: "A modern commercial space in GIFT City, Corporate Plaza is perfect for startups and enterprises. Fully furnished offices, high-speed internet, and conference rooms included.",
      ),
      PropertyModel(
        name: "Green Valley Residency",
        desc: "Unfurnished",
        image: "assets/images/property4.jpg",
        location: "Vadodara",
        latitude: 22.3072,
        longitude: 73.1812,
        price: "12,75,000",
        type: "Holiday Homes",
        description: "Green Valley offers 1BHK and 2BHK flats surrounded by greenery. A gated community with jogging tracks and ample parking space, perfect for peaceful living.",
      ),
      PropertyModel(
        name: "Metro View Apartments",
        desc: "Fully Furnished",
        image: "assets/images/property5.jpg",
        location: "Surat",
        latitude: 21.1702,
        longitude: 72.8311,
        price: "22,00,000",
        type: "Residential",
        description: "Centrally located near Surat Metro Station, this fully furnished apartment offers 3BHK units with modern interiors, 24x7 water supply, and power backup.",
      ),
      PropertyModel(
        name: "Industrial Work Hub",
        desc: "Raw Space",
        image: "assets/images/property6.jpg",
        location: "Sanand",
        latitude: 22.9920,
        longitude: 72.3818,
        price: "40,00,000",
        type: "Commercial",
        description: "Spacious industrial work area in Sanand ideal for manufacturing units. Features include easy highway access, truck loading bay, and customizable layout.",
      ),
      PropertyModel(
        name: "The Urban Nest",
        desc: "Semi Furnished",
        image: "assets/images/property6.jpg",
        location: "Gandhinagar",
        latitude: 23.2230,
        longitude: 72.6500,
        price: "16,20,000",
        type: "Residential",
        description: "A modern apartment complex in Gandhinagar featuring semi-furnished 2BHK units with balcony views, rooftop garden, and 24/7 security.",
      ),
    ];
  }
}
