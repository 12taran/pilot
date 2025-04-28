import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/pilotController.dart';

class Propertydetail extends StatefulWidget {
  const Propertydetail({super.key, required this.property});
  final PropertyModel property;
  @override
  State<Propertydetail> createState() => _PropertydetailState();
}

class _PropertydetailState extends State<Propertydetail> {
  Pilotcontroller pilotcontroller = Get.put(Pilotcontroller());
  @override

   @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                widget.property.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 220, 217, 217),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.property.name!,
                      style: GoogleFonts.acme(
                        fontSize: Constants.fontSizeExtraLarge,
                      ),
                    ),
                    Text(
                      widget.property.desc!,
                      style: GoogleFonts.lato(
                        fontSize: Constants.fontSizeBody,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width * 0.3,
                height: Get.height * 0.035,
                margin: const EdgeInsets.only(right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 146, 198, 232),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.property.type!,
                    style: GoogleFonts.abel(
                      fontSize: Constants.fontSizeSubTitle,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text(
                  widget.property.location!,
                  style: GoogleFonts.lato(
                    fontSize: Constants.fontSizeSubTitle,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _investmentCard('11%', 'Est. IRR', Colors.green[100]!),
                _investmentCard('1800', 'SQFTS', Colors.grey[200]!),
                _investmentCard('₹ 1.47 Cr', 'Target Capital Raise', Colors.grey[200]!),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "!! Returns are not guaranteed and are subjected to market risks !!",
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 149, 149, 149),
                fontSize: Constants.fontSizeTinySmall,
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.property.desc ?? 'No description available',
              style: GoogleFonts.lato(
                fontSize: Constants.fontSizeSubTitle,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Investment Benefits",
              style: TextStyle(fontSize: Constants.fontSizeHeading, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 217, 221, 221),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal.shade200),
      ),
              child: Column(
                children: pilotcontroller.benefits.map((benefit) {
                  return BenefitItem(
                    title: benefit["title"] ?? "No Title",
                    description: benefit["description"] ?? "No Description",
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey[100],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price per Alt.SQFT',
            style: GoogleFonts.lato(
              fontSize: Constants.fontSizeSubTitle,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Text(
            "Rs ${widget.property.price!}",
            style: GoogleFonts.aleo(
              fontSize: Constants.fontSizeHeading,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 30, 15, 114),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomButtons(
                margin: EdgeInsets.all(5),
                borderRadius: 10,
                width: Get.width * 0.3,
                color: const Color.fromARGB(255, 98, 97, 95),
                onPressed: () {},
                text: 'Sell',
              ),
              SizedBox(width: 10),
              CustomButtons(
                margin: const EdgeInsets.all(5),
                borderRadius: 10,
                width: Get.width * 0.55,
                text: 'Buy',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

  }

  Widget _investmentCard(String value, String label, Color bgColor) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  
class BenefitItem extends StatelessWidget {
  final String title;
  final String description;

  BenefitItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('-'),
            Text(title,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal.shade900)),
          ],
        ),
        SizedBox(height: 4),
        Text(description, style: TextStyle(color: Colors.teal.shade800)),
      ],
    );
  }
}

