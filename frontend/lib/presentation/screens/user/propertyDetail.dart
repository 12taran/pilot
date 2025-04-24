import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
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
            Stack(
            children: [
              Image.asset(
                widget.property['image']!, // Replace with your asset or use Image.network
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
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness:2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 10),
                    child: Text(
                      widget.property['name']!,
                      style: GoogleFonts.acme(fontSize: Constants.fontSizeExtraLarge),
                    ),
                  ),
                   Padding(padding: EdgeInsets.only(left: 10,top: 0),
          child: Text(
              widget.property['desc']!,
              style: GoogleFonts.lato(fontSize: Constants.fontSizeBody,fontWeight: FontWeight.w400,color:Theme.of(context).colorScheme.primary),
            ),)
                ],
              ),
               GlowContainer(
                                  glowRadius: 10,
                                  containerOptions: const ContainerOptions(borderRadius:10,
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.only(right: 5)),
                                  gradientColors: [Color.fromARGB(255, 36, 109, 38),Colors.white],
                                  child: Container(
                                    width: Get.width * 0.3,
                                    height: Get.height*0.04,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 0),
                                    margin: const EdgeInsets.only(right: 0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 164, 227, 127),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.property['type']!,
                                        style: TextStyle(
                                            fontSize: Constants.fontSizeSubTitle,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ),
                                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(
                    widget.property['location']!,
                    style: GoogleFonts.lato(fontSize: Constants.fontSizeSubTitle,fontWeight: FontWeight.w400,color:Colors.red),
                  ),
              ],
            ),
          )
          ,
           
           Divider(thickness: 2,),
           Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child: Text(
    widget.property['description'] ?? 'No description available',style:GoogleFonts.lato(
      fontSize: Constants.fontSizeSubTitle,
    ),
  ),
),
Spacer(),
Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price per Alt.SQFT'),
                    SizedBox(height: 4),
                    Text(
                      "Rs ${widget.property['price']!}",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                     Row(
                  children: [
                    CustomButtons(
                      borderRadius: 20,
                      width: Get.width*0.3,
                      color: Colors.orange,
                      onPressed: () {},
                      text: 'Sell',
                    ),
                    SizedBox(width: 10),
                   CustomButtons(
                    borderRadius: 20,
                    width: Get.width*0.55,
                    text: 'Buy', onPressed:(){})
                  ],
                ),
                  ],
                ),
               
              ],
            ),
),


         

        ]));
  }
}
