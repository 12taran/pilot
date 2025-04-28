// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  File? _profileImage;
  final picker = ImagePicker();
  final usercontroller =
      Get.find<Usercontroller>(); // This gets the already created controller

  // Editable controllers@override
  @override
  void initState() {
    super.initState();
  }

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 98, 57),
        title: const Text("User Profile"),
        centerTitle: true,
      ),
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
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                          image: DecorationImage(
                            image: _profileImage != null
                                ? FileImage(_profileImage!) as ImageProvider
                                : NetworkImage(
                                    '${ApiRoutes.imageRoutes}${usercontroller.userImageUrl.value}'),
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
                          decoration: const BoxDecoration(
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
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.grey,
                          ),
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MyTextField(
                        labelText: 'Name',
                        onChanged: (value) {},
                        textStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        controller: usercontroller.nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: MyTextField(
                        labelText: 'Phone No.',
                        onChanged: (value) {},
                        textStyle: const TextStyle(color: Colors.black),
                        enable: false,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        controller: usercontroller.mobileController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MyTextField(
                        labelText: 'Address',
                        onChanged: (value) {},
                        textStyle: const TextStyle(color: Colors.black),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        controller: usercontroller.addressController,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              CustomButtons(
                  color: const Color.fromARGB(255, 56, 98, 57),
                  fontSize: 20,
                  width: Get.width * 0.5,
                  text: 'Save',
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    String? userId = prefs.getString(Constants.USER_ID);
                    usercontroller.editUser(
                        usercontroller.nameController.text,
                        usercontroller.addressController.text,
                        userId ?? "",
                        _profileImage);
                    // Utils.showToast(message: 'User Details saved Successfully');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
