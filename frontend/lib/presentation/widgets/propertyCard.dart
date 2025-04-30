import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/routes/page_route.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key, required this.property});
  final PropertyModel property;

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        backgroundColor: Theme.of(context).cardColor,
        padding: 5,
        //margin: EdgeInsets.all(5),
        borderWidth: 3,
        borderRadius: 10,
        width: Get.width * 0.9,
        height: Get.height * 0.3,
        borderColor: Theme.of(context).highlightColor,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.asset(
                  widget.property.image!,
                  fit: BoxFit.cover,
                  height: Get.height * 0.2,
                  width: Get.width * 0.9,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.property.name!,
                        maxLines: 2,
                        style: GoogleFonts.almarai(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontSize: Constants.fontSizeSmall + 2,
                            fontWeight: FontWeight.w500),
                      ),
                       Row(
                children: [
                  Text(
                    "${Constants.rupeeSymbol}${widget.property.price!}/- ",
                    style: GoogleFonts.andika(
                        fontSize: Constants.fontSizeSubTitle,
                        fontWeight: FontWeight.w900,
                        color:
                            Theme.of(context).textTheme.bodyLarge?.color),
                  ),
                  Text(
                    'SQFT',
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            Theme.of(context).textTheme.bodyLarge?.color),
                  )
                ],
              )
                    
                  
                ],
              ),
               GestureDetector(
                    onTap: () {
                      print('Invest now1');
                      PropertyModel detail = widget.property;
                      Get.toNamed(PageRoutes.propertydetail, arguments: detail);
                    },
                    child: GlowContainer(
                      gradientColors: [Colors.green],
                      containerOptions: ContainerOptions(
                        margin: const EdgeInsets.all(2),
                        width: Get.width * 0.27,
                        height: Get.height * 0.04,
                        borderRadius: 15,
                        backgroundColor: Colors.white,
                      
                      ),
                      child: Center(
                        child: Text(
                          'Invest Now ',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 64, 255, 0),
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
             
              
              
            ])
            ])
            );
  }
}
