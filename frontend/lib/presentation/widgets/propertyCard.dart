import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/page_route.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key, required this.property});
  final Map<String, String> property;

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
                  widget.property['image']!,
                  fit: BoxFit.cover,
                  height: Get.height * 0.2,
                  width: Get.width * 0.9,
                ),
              ),
              Text(
                widget.property['name']!,
                maxLines: 2,
                style: GoogleFonts.almarai(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: Constants.fontSizeSmall + 2,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${Constants.rupeeSymbol}${widget.property['price']!}/- ",
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
                  ),
                  // const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      print('Invest now1');
                      Map<String, String> detail = widget.property;
                      Get.toNamed(PageRoutes.propertydetail, arguments: detail);
                    },
                    child: Text(
                      'Invest Now ',
                      style: GoogleFonts.aBeeZee(
                        fontSize: Constants.fontSizeSmall,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ]));
  }
}
