import 'package:get/get.dart';

class PropertyController extends GetxController {
  RxList<Map<String, String>> properties = [
    {
      "name": "Residential House",
      "desc": "Fully Furnished",
      "image": "assets/images/property1.jpg",
      "location": "Dhulera",
      "price": "10,00,000",
      "type": "Residential"
    },
    {
      "name": "Luxury Villa",
      "desc": "Pool + Garden",
      "image": "assets/images/property2.jpg",
      "location": "Ahmedabad",
      "price": "2,50,00,000",
      "type": "Residential"
    },
    {
      "name": "Commercial Shop",
      "desc": "Main Market Area",
      "image": "assets/images/property3.jpg",
      "location": "Surat",
      "price": "50,00,000",
      "type": "Commercial"
    },
    {
      "name": "Farm House",
      "desc": "Peaceful Area with Trees",
      "image": "assets/images/property4.jpg",
      "location": "Vadodara",
      "price": "1,20,00,000",
      "type": "Residential"
    },
    {
      "name": "Office Space",
      "desc": "Corporate Setup Ready",
      "image": "assets/images/property5.jpg",
      "location": "GIFT City",
      "price": "80,00,000",
      "type": "Commercial"
    },
    {
      "name": "Studio Apartment",
      "desc": "Ideal for Working Professionals",
      "image": "assets/images/property6.jpg",
      "location": "Gandhinagar",
      "price": "30,00,000",
      "type": "Residential"
    },
  ].obs;
}
