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
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.3,
              child:   Image.asset(
                widget.property['image']!,
                fit: BoxFit.fill,
              ) ),
          const SizedBox(
            height: 1,
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
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Row(
                                      children: [
                                        Text(
                                          "Rs ${widget.property['price']!}/- ",
                                          style: TextStyle(
                                              fontSize: Constants.fontSizeBody,
                                              fontWeight: FontWeight.w800,
                                              color: const Color.fromARGB(
                                                  255, 26, 27, 26)),
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Per',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 26, 27, 26)),
                                            ),
                                            Text(
                                              'SQFT',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 26, 27, 26)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
           ),
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
Center(
  child: CustomButtons(
    width: Get.width*0.7,
    text:'Contact Seller',
  color: Colors.orange,
  borderRadius: 20,
   onPressed: (){}),
)

         

        ]));
  }
}
