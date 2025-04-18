import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';

class Propertydetail extends StatefulWidget {
  const Propertydetail({super.key, required this.property});
  final Map<String, String> property;
  @override
  State<Propertydetail> createState() => _PropertydetailState();
}

class _PropertydetailState extends State<Propertydetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: double.infinity,
              height: Get.height * 0.3,
              child: Image.asset(
                widget.property['image']!,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.property['name']!,
              style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
            ),
          )
        ]));
  }
}
