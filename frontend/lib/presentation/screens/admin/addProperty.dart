import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
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

AdminPropertyController addPropertyController =
    Get.put(AdminPropertyController());

class _AddpropertyState extends State<Addproperty> {
  final ImagePicker picker = ImagePicker();

  Future<void> _pickMultipleImages() async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      addPropertyController.selectedImages.value =
          pickedFiles.map((file) => File(file.path)).toList();
    }
  }

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
              Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Upload container

                      const SizedBox(height: 15),

                      // Preview carousel
                      addPropertyController.selectedImages.isNotEmpty
                          ? CarouselSlider.builder(
                              itemCount:
                                  addPropertyController.selectedImages.length +
                                      1, // +1 for the "Add More" button
                              options: CarouselOptions(
                                height: Get.height * 0.3,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                enlargeCenterPage: false,
                              ),
                              itemBuilder: (context, index, realIndex) {
                                if (index ==
                                    addPropertyController
                                        .selectedImages.length) {
                                  // "Add More" button at the end
                                  return GestureDetector(
                                    onTap: () async {
                                      final List<XFile>? pickedFiles =
                                          await picker.pickMultiImage();
                                      if (pickedFiles != null &&
                                          pickedFiles.isNotEmpty) {
                                        setState(() {
                                          addPropertyController.selectedImages
                                              .addAll(
                                            pickedFiles
                                                .map((file) => File(file.path)),
                                          );
                                        });
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      decoration: BoxDecoration(
                                        // color: Colors.grey.shade200,

                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.add,
                                            size: 40,
                                            color: Colors.grey.shade600),
                                      ),
                                    ),
                                  );
                                } else {
                                  final file = addPropertyController
                                      .selectedImages[index];
                                  return CustomContainer(
                                    padding: 5,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            file,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              addPropertyController
                                                  .selectedImages
                                                  .removeAt(index);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black54,
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            )
                          : CustomContainer(
                              height: Get.height * 0.25,
                              width: double.infinity,
                              padding: 20,
                              borderRadius: 12,
                              borderWidth: 1.5,
                              borderColor: Colors.grey.shade400,
                              backgroundColor: Colors.grey.shade100,
                              onTap: () async {
                                await _pickMultipleImages();
                              },
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload_outlined,
                                      size: 50,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Tap to select images',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                    if (addPropertyController
                                        .selectedImages.isNotEmpty) ...[
                                      const SizedBox(height: 10),
                                      Text(
                                        '${addPropertyController.selectedImages.length} image(s) selected',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green.shade600,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ),
                    ],
                  );
                },
              ),
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
                keyboardType: TextInputType.number,
                onChanged: (value) => {
                  addPropertyController.pricePerSqfeet(
                    double.tryParse(
                            addPropertyController.areaController.text) ??
                        1.0,
                    double.tryParse(
                            addPropertyController.priceController.text) ??
                        0.0,
                  )
                },
                labelText: 'Price',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: addPropertyController.priceController,
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
                keyboardType: TextInputType.number,
                onChanged: (value) => {
                  addPropertyController.pricePerSqfeet(
                    double.tryParse(
                            addPropertyController.areaController.text) ??
                        1.0,
                    double.tryParse(
                            addPropertyController.priceController.text) ??
                        0.0,
                  )
                },
                labelText: 'Area In Gaj',
                textStyle: TextStyle(
                  fontSize: Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                isLabelEnabled: false,
                controller: addPropertyController.areaController,
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
                        keyboardType: TextInputType.number,
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
              CustomButtons(
                  text: 'Add',
                  onPressed: () async {
                    await addPropertyController.addProperty();
                    Get.back();
                    addPropertyController.clearControllers();
                  }),
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
