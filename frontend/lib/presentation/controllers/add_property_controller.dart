import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/data/repos/adminPropertyRepo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPropertyController extends GetxController {
  TextEditingController propertyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController priceInSqFeetController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  RxString selectedPropertyType = "".obs;
  RxList<File> selectedImages = <File>[].obs;
  RxList<PropertyModel> adminProperties = <PropertyModel>[].obs;
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

  Future<void> getAdiminProperties() async {
    AdminpropertyRepo adminPropertyRepo = AdminpropertyRepo();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString(Constants.USER_ID);
    List<PropertyModel> response =
        await adminPropertyRepo.getPropertiesbyId(userId ?? "");
    adminProperties.value = response;
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
    print("area in gaj: $areaInGaj");
    print("Price : $price");
    print("Area in sq feet: $areaInSqFeet");
    double pricePerSqFeet = price / areaInSqFeet;
    print("Price per sq feet: $pricePerSqFeet");
    priceInSqFeetController.text = pricePerSqFeet.toStringAsFixed(2);
  }

  Future<void> addProperty() async {
    String propertyName = propertyNameController.text;

    String pinCode = pinCodeController.text;
    String location = locationController.text + ", " + pinCode;
    String latitude = latitudeController.text;
    String longitude = longitudeController.text;
    String priceInSqFeet = priceInSqFeetController.text;
    String propertyType = selectedPropertyType.value;
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(Constants.USER_ID);

    print('User ID: $userId');

    List<File> images = selectedImages;
    Map<String, String> property = {
      "projectName": propertyName,
      "address": location,
      "latitude": latitude,
      "longitude": longitude,
      "price": priceInSqFeet,
      "type": propertyType,
      'description': "aaaa",
      "userId": userId ?? "",
      "area": priceInSqFeet,
    };
    bool created = await AdminpropertyRepo().createProperties(property, images);
    if (created) {
      print('Property created successfully');
      Utils.showToast(message: 'Property created successfully');
    } else {
      print('Property creation failed');
      Utils.showToast(message: 'Property creation failed');
    }
  }

  void clearControllers() {
    propertyNameController.clear();
    locationController.clear();
    pinCodeController.clear();
    latitudeController.clear();
    longitudeController.clear();
    priceInSqFeetController.clear();
    descriptionController.clear();
    selectedImages.clear();
    selectedPropertyType.value = "";
    priceInSqFeetController.clear();
    priceController.clear();
    areaController.clear();
  }
}
