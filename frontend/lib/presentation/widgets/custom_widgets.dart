import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/invest_model.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:pilot_project/routes/page_route.dart';

class CustomWidgets {
  static Widget propertyCard(PropertyController controller,
      PropertyModel property, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(PageRoutes.propertydetail, arguments: property);
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Center(
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${ApiRoutes.imageRoutes}${property.images[0]}'),
                            fit: BoxFit.cover,
                          ),
                        ))),
              ),

              const SizedBox(width: 16),

              // Property Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.projectName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Price: ${Constants.rupeeSymbol}${property.price}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(PageRoutes.propertydetail,
                              arguments: property);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        child: const Text("Invest Now"),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return Center(
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        if (controller.isFav.contains(property)) {
                          controller.isFav.remove(property);
                        } else {
                          controller.isFav.add(property);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: controller.isFav.contains(property)
                            ? Colors.red
                            : Colors.grey,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero, // So the icon centers nicely
                      constraints:
                          BoxConstraints(), // Removes default button size
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  static Widget propertyCardAdmin(
      PropertyModel property, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(PageRoutes.propertydetail, arguments: property);
      },
      child: Card(
        color: Color.fromARGB(255, 192, 217, 180),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Property Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Center(
                    child: Container(
                        height: 100,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${ApiRoutes.imageRoutes}${property.images[0]}'),
                            fit: BoxFit.cover,
                          ),
                        ))),
              ),

              const SizedBox(width: 16),

              // Property Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.projectName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Price: ${Constants.rupeeSymbol}${property.price} /- Per sqft" ,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

static Widget portfolioCard(BuildContext context, int index, List<InvestmentModel> investments) {
  final investment = investments[index];
  final theme = Theme.of(context);

  return Card(
     color: Theme.of(context).cardColor,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Name
          Row(
            children: [
              const Icon(Icons.home, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  investment.property.projectName,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Investment Values
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _valueBlock(
                title: "Invested",
                value:
                    "${Constants.rupeeSymbol}${(investment.areaInvested * investment.priceAtPurchase).toStringAsFixed(2)}",
                theme: theme,
              ),
              _valueBlock(
                title: "Current Value",
                value:
                    "${Constants.rupeeSymbol}${(investment.areaInvested).toStringAsFixed(2)}",
                theme: theme,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

static Widget _valueBlock({
  required String title,
  required String value,
  required ThemeData theme,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: theme.textTheme.bodyLarge?.color,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value,
        style: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    ],
  );
}

    
    
    /* Column(
      children: [
        CustomContainer(
          backgroundColor: Theme.of(context).cardColor,
          padding: 2,
          borderRadius: 0,
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.house),
                    SizedBox(width: 10),
                    Text(
                      investment.property.projectName ?? 'Property ${index + 1}',
                      style: GoogleFonts.aBeeZee(
                        fontSize: Constants.fontSizeBody,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                CustomContainer(
                  borderColor: Colors.grey,
                  elevation: 10,
                  backgroundColor: Theme.of(context).cardColor,
                  borderRadius: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Invested Value
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invested",
                            style: GoogleFonts.aBeeZee(
                              fontSize: Constants.fontSizeSmall,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          Text(
                            "${Constants.rupeeSymbol}${(investment.areaInvested * investment.priceAtPurchase).toStringAsFixed(2)}",
                            style: GoogleFonts.aBeeZee(
                              fontSize: Constants.fontSizeTinySmall + 1,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      // Current Value
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Value",
                            style: GoogleFonts.aBeeZee(
                              fontSize: Constants.fontSizeSmall,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          Text(
                            "${Constants.rupeeSymbol}${(investment.areaInvested).toStringAsFixed(2)}",
                            style: GoogleFonts.aBeeZee(
                              fontSize: Constants.fontSizeTinySmall + 1,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Theme.of(context).dividerColor,
          height: 1,
        )
      ],
    );*/
    
    }



