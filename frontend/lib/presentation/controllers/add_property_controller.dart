import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddPropertyController extends GetxController {
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController priceInSqFeetController = TextEditingController();
  RxString selectedPropertyType = "".obs;
  Future<Map<String, double>?> getCoordinatesFromAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final url =
        'https://nominatim.openstreetmap.org/search?q=$encodedAddress&format=json';

    try {
      final response = await http.get(Uri.parse(url),
          headers: {'User-Agent': 'FlutterApp'} // Nominatim requires this
          );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final lat = double.parse(data[0]['lat']);
          final lon = double.parse(data[0]['lon']);
          return {'latitude': lat, 'longitude': lon};
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  void fetchLocation(String address) async {
    // Replace with your address
    final coordinates = await getCoordinatesFromAddress(address);

    if (coordinates != null) {
      print(
          'Latitude: ${coordinates['latitude']}, Longitude: ${coordinates['longitude']}');
      latitudeController.text = coordinates['latitude'].toString();
      longitudeController.text = coordinates['longitude'].toString();
    } else {
      print('Failed to get coordinates.');
    }
  }

  void pricePerSqfeet(double areaInGaj, double price) {
    double areaInSqFeet = areaInGaj * 9;
    double pricePerSqFeet = price / areaInSqFeet;
    print("Price per sq feet: $pricePerSqFeet");
    priceInSqFeetController.text = pricePerSqFeet.toStringAsFixed(2);
  }
}
