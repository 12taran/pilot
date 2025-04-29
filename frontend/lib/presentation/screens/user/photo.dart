import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/api_routes.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({super.key, required this.imageUrl, required this.name});
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          name,
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: Get.height * 0.5,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage('${ApiRoutes.imageRoutes}${imageUrl}'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
