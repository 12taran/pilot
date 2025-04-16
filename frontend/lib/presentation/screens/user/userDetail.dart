// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilot_project/core/components/MyTextField.dart';

import 'package:pilot_project/routes/page_route.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  File? _profileImage;
  File? _backgroundImage;

  final picker = ImagePicker();

  // Dummy user details (can fetch from Firebase or any backend)
  String userName = "Prince Dubey";
  String email = "prince@example.com";
  String mobile = "123456XXXX";
  String dob = "01-01-2000";

  Future<void> _pickImage(bool isProfile) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isProfile) {
          _profileImage = File(pickedFile.path);
        } else {
          _backgroundImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Stack(
  clipBehavior: Clip.none,
  children: [
   Stack(
  children: [
    // Background image container (placed first, rendered at the bottom)
    Container(
      width: Get.width,
      height: Get.height * 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: _backgroundImage != null
            ? DecorationImage(
                image: FileImage(_backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
    ),

    // Edit icon (rendered on top)
    Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () => _pickImage(false),
        child: Container(
          padding: const EdgeInsets.all(6),
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

   Positioned(
  bottom: -50, // Overlapping the background
  left: Get.width / 3, // You can tweak this for perfect centering
  child: Stack(
    alignment: Alignment.topRight,
    children: [
      GestureDetector(
        onTap: () => _pickImage(true),
        child: Container(
          width: 150,
          height: 150,
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
                  : const AssetImage("assets/images/onboarding1.png")
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
          onTap: () => _pickImage(true),
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

   
  ],
),
const SizedBox(height: 70), // prevent overlap with rest of the UI
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: Get.width*0.8,
                 margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical:5),
                        decoration: BoxDecoration(
                         color: Colors.white, // background color (optional)
                  border: Border.all(
                    color: Colors.black, // border color
                    width: 2.0,         // border width
                  ),
              
                          borderRadius: BorderRadius.circular(5)
                        ),
                child: Column(children: [
                  _buildDetailTile(Icons.person, 'Name', 'abc@1234'),
                  _buildDetailTile(Icons.phone, 'Phone No.', '234'),
                  _buildDetailTile(Icons.cake, 'DOB', 'abc@1234'),
                  _buildDetailTile(Icons.email, 'Email', 'abc@1234'),
                  _buildDetailTile(Icons.location_city, 'Location', 'abc@1234')
                ],),
              ),
            )
           
           
          ],
        ),
      ),
    );
  }
Widget _buildDetailTile(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
