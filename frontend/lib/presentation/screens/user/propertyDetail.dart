import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/rozarpay_service.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/pilotController.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/screens/user/photo.dart';
import 'package:pilot_project/presentation/utils_widget.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:pilot_project/routes/page_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Propertydetail extends StatefulWidget {
  const Propertydetail({super.key, required this.property});
  final PropertyModel property;
  @override
  State<Propertydetail> createState() => _PropertydetailState();
}

class _PropertydetailState extends State<Propertydetail> {
  Pilotcontroller pilotcontroller = Get.put(Pilotcontroller());
  final razorpayService = RazorpayService();
  final GlobalKey previewContainer = GlobalKey();
  PropertyController propertyController = Get.put(PropertyController());

  @override
  void initState() {
    super.initState();
    razorpayService.init();
  }

  @override
  void dispose() {
    razorpayService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: Get.height * 0.4,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                  ),
                  items: widget.property.images.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(PhotoView(
                                imageUrl: imageUrl,
                                name: widget.property.projectName!));
                          },
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${ApiRoutes.imageRoutes}$imageUrl'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
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
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          widget.property.projectName!,
                          maxLines: 3,
                          style: GoogleFonts.acme(
                            fontSize: Constants.fontSizeExtraLarge,
                          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(PageRoutes.mapPage, arguments: {
                        'latitude': widget.property.latitude,
                        'longitude': widget.property.longitude,
                        'placeName': widget.property.projectName,
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 5),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: Text(
                            widget.property.address!,
                            maxLines: 3,
                            style: GoogleFonts.lato(
                              fontSize: Constants.fontSizeSubTitle,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.find<PropertyController>()
                          .generateAndSavePdf(context, widget.property);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: const Color.fromARGB(255, 7, 57, 52)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        //width: Get.width * 0.4,
                        height: Get.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download,
                              size: Constants.iconSizeSmall,
                            ),
                            Text(
                              'Download Brochure',
                              style: TextStyle(
                                  fontSize: Constants.fontSizeTiny,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _investmentCard('11%', 'Est. IRR', Colors.green[100]!),
                  _investmentCard('1800', 'SQFTS', Colors.grey[200]!),
                  _investmentCard(
                      '₹ 1.47 Cr', 'Target Capital Raise', Colors.grey[200]!),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: GoogleFonts.aBeeZee(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Constants.fontSizeHeading,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.property.description ?? 'No description available',
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
                style: TextStyle(
                    fontSize: Constants.fontSizeHeading,
                    fontWeight: FontWeight.bold),
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
              'Price per SQFT',
              style: GoogleFonts.lato(
                fontSize: Constants.fontSizeSubTitle,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            Text(
              "${Constants.rupeeSymbol}${widget.property.price!}",
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
                  onPressed: () async {},
                  text: 'Sell',
                ),
                SizedBox(width: 10),
                CustomButtons(
                  margin: const EdgeInsets.all(5),
                  borderRadius: 10,
                  width: Get.width * 0.55,
                  text: 'Buy',
                  onPressed: () async {
                    TextEditingController amountController =
                        TextEditingController(text: "1");
                    UtilsWidget.showWebXDialog(
                        context,
                        Container(
                          height: Get.height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Enter Amount to Buy',
                                  style: GoogleFonts.aBeeZee(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: Constants.fontSizeSubTitle,
                                      fontWeight: FontWeight.bold)),
                              MyTextField(
                                keyboardType: TextInputType.number,
                                labelText: "Enter Amount to Buy",
                                isLabelEnabled: false,
                                onChanged: (v) {},
                                borderWidth: 2,
                                controller: amountController,
                              ),
                              SizedBox(height: 20),
                              CustomButtons(
                                  text: 'Submit',
                                  onPressed: () async {
                                    onPressed:
                                    () async {
                                      print('Amount: ${widget.property.price}');

                                      final amountInRupees = (double.tryParse(
                                                  widget.property.price) ??
                                              0.0)
                                          .toInt();

                                      // Step 1: Start Razorpay payment
                                      await razorpayService
                                          .openCheckout(amountInRupees)
                                          .then((_) async {
                                        // Step 2: After payment flow ends, check if payment was verified
                                        if (propertyController
                                            .paymentVerified.value) {
                                          // Step 3: Retrieve user ID from shared preferences
                                          final pref = await SharedPreferences
                                              .getInstance();
                                          final userId = pref.getString(
                                                  Constants.USER_ID) ??
                                              "";

                                          // Step 4: Parse amount input by user (optional)
                                          final amountText =
                                              amountController.text.trim();
                                          final parsedAmount =
                                              double.tryParse(amountText) ??
                                                  0.0;

                                          // Step 5: Call your backend to register the purchase
                                          await propertyController.buysProperty(
                                            widget.property.id,
                                            userId,
                                            parsedAmount,
                                          );

                                          // Reset verification flag
                                          propertyController
                                              .paymentVerified.value = false;

                                          // Step 6: Provide feedback to user
                                          Get.snackbar(
                                            "Success",
                                            "Property purchased successfully!",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                          );

                                          Get.back();
                                        } else {
                                          print('Buy nahi hui h');
                                          Get.snackbar(
                                            "Failed",
                                            "Payment was not verified. Purchase failed.",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                        }
                                      }).catchError((e) {
                                        // Handle Razorpay or other errors
                                        print('Payment Error: $e');
                                        Get.snackbar(
                                          "Error",
                                          "Something went wrong during payment.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                        );
                                      });
                                    };
                                  })
                            ],
                          ),
                        ));
                  },
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900)),
          ],
        ),
        SizedBox(height: 4),
        Text(description, style: TextStyle(color: Colors.teal.shade800)),
      ],
    );
  }
}
