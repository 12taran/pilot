// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/utils.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  File? _profileImage;
  final picker = ImagePicker();

  // Editable controllers
  final nameController = TextEditingController(text: "Harry Wilson");
  final emailController = TextEditingController(text: "prince@yahoo.com");
  final mobileController = TextEditingController(text: "123456XXXX");
  final dobController = TextEditingController(text: "01-01-2000");
  final locationController = TextEditingController(text: "Mohali, Punjab");

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomButtons(
          text: 'Save',
          onPressed: () {
            Utils.showToast(message: 'User Details saved Successfully');
            Future.delayed(Duration(seconds: 1), () {
              Get.back();
            });
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: _profileImage != null
                                ? FileImage(_profileImage!)
                                : const AssetImage(
                                        "assets/images/onboarding1.png")
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.edit, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildEditableField(
                        Icons.person, "Name", nameController, false),
                    _buildEditableField(
                        Icons.phone, "Phone No.", mobileController, true),
                    _buildEditableField(
                        Icons.cake, "DOB", dobController, false),
                    _buildEditableField(
                        Icons.email, "Email", emailController, true),
                    _buildEditableField(Icons.location_city, "Location",
                        locationController, false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(IconData icon, String label,
      TextEditingController controller, bool readOnly) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              prefixIcon: Icon(icon),
              readOnly: readOnly,
              controller: controller,
              labelText: label,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
