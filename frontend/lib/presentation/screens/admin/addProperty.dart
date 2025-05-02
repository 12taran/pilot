import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';

import 'dart:convert';

import 'package:pilot_project/presentation/controllers/add_property_controller.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';

class Addproperty extends StatefulWidget {
  const Addproperty({super.key});

  @override
  State<Addproperty> createState() => _AddpropertyState();
}

AddPropertyController addPropertyController = Get.put(AddPropertyController());

class _AddpropertyState extends State<Addproperty> {
  final ImagePicker picker = ImagePicker();
  List<File> _selectedImages = [];
  Future<void> _pickMultipleImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _selectedImages = pickedFiles.map((file) => File(file.path)).toList();
      });
    }
  }

  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Property"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 56, 98, 57),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Add your form fields here
              // For example:
              Text(
                " Property Name",
                style: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              MyTextField(
                onChanged: (value) => {},
                labelText: 'Property Name',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: addPropertyController.propertyNameController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " Property Address",
                style: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              MyTextField(
                onChanged: (value) => {},
                labelText: 'Property Address',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: addPropertyController.locationController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " PinCode",
                style: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              MyTextField(
                isLabelEnabled: false,
                //borderColor: Constants.primaryColor,
                controller: addPropertyController.pinCodeController,
                labelText: "PinCode",

                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                onChanged: (v) {},
              ),
              // Add more fields as needed
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Latitude",
                        style: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                      MyTextField(
                        onTap: () {
                          addPropertyController.fetchLocation(
                              '${addPropertyController.locationController.text} ${addPropertyController.pinCodeController.text}');
                        },
                        isLabelEnabled: false,
                        //borderColor: Constants.primaryColor,
                        controller: addPropertyController.latitudeController,
                        textStyle: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        labelText: "Latitude",
                        onChanged: (v) {},
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Longitude",
                        style: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                      MyTextField(
                        isLabelEnabled: false,
                        textStyle: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        //borderColor: Constants.primaryColor,
                        controller: addPropertyController.longitudeController,
                        labelText: "Longitude",
                        onChanged: (v) {},
                      ),
                    ],
                  ))
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                " Price",
                style: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              MyTextField(
                onChanged: (value) => {},
                labelText: 'Price',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: priceController,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " Area In Gaj",
                style: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              MyTextField(
                onChanged: (value) => {
                  addPropertyController.pricePerSqfeet(
                      double.tryParse(priceController.text) ?? 0.0,
                      double.tryParse(areaController.text) ?? 1.0)
                },
                labelText: 'Area In Gaj',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: areaController,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Price Per SqFeet",
                        style: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                      MyTextField(
                        labelText: 'Price Per SqFeet',
                        textStyle: TextStyle(
                          fontSize: Constants.fontSizeSmall,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        onChanged: (v) {},
                        isLabelEnabled: false,
                        controller:
                            addPropertyController.priceInSqFeetController,
                      )
                    ],
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Type",
                          style: TextStyle(
                            fontSize: Constants.fontSizeSmall,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                        CustomContainer(
                          elevation: 0,
                          height: Get.height * 0.07,
                          padding: 5,
                          borderWidth: 1,
                          borderRadius: 10,
                          borderColor: Colors.black26,
                          child: Obx(() {
                            final controller = Get.find<PropertyController>();
                            final items = controller.types;
                            final value = addPropertyController
                                .selectedPropertyType.value;

                            // Avoid the error by only assigning the value if it exists in the list
                            final validValue =
                                items.contains(value) ? value : null;

                            return DropdownButton<String>(
                              hint: Text("Select Type"),
                              value: validValue,
                              items: items.map((v) {
                                return DropdownMenuItem<String>(
                                  value: v,
                                  child: Text(v),
                                );
                              }).toList(),
                              onChanged: (v) {
                                if (v != null)
                                  addPropertyController
                                      .selectedPropertyType.value = v;
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtons(text: 'Add', onPressed: () {}),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
