import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/board_member.dart';
import 'package:pilot_project/presentation/controllers/boardmember_controller.dart';
import 'package:pilot_project/presentation/controllers/pilotController.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/presentation/widgets/flip_card.dart';
import 'package:pilot_project/presentation/widgets/teamcard.dart';

class Homew extends StatefulWidget {
  const Homew({super.key});

  @override
  State<Homew> createState() => _HomewState();
}

class _HomewState extends State<Homew> {
  List city = ['Mohali', '  Dhulera', 'Himachal'];

  List location = [
    'assets/images/mohali.jpg',
    'assets/images/dholera.jpg',
    'assets/images/chandigarh.jpg'
  ];

  PropertyController propertyController = Get.find();
  Usercontroller usercontroller = Get.find();
  BoardMemberController boardMemberController = Get.find();
  Pilotcontroller pilotcontroller = Get.put(Pilotcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD8CFC2), // soft beiges
                Color(0xFF8BA1E6), // soft purple-blue
              ],
            ),
          ),
          child: Stack(
            children: [
              // Arrow image (positioned at bottom right)
              Positioned(
                top: Get.height * 0.2,
                left: Get.width * 0.2,
                child: Image.asset(
                  'assets/images/arrow.png',
                  width: 350,
                ),
              ),

              // Main text and button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Investing in\n',
                          style: TextStyle(
                            fontSize: Constants.fontSizeSubTitle,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Real Estate ',
                          style: TextStyle(
                            fontSize: Constants.fontSizeSubTitle + 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          ),
                        ),
                        TextSpan(
                          text: 'made easy\nfor everyone',
                          style: TextStyle(
                            fontSize: Constants.fontSizeSubTitle,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Buy and sell properties 1 SQFT at a time!\n₹10,000 onwards',
                    style: TextStyle(
                      fontSize: Constants.fontSizeTinySmallMini,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Get started'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'TradeX',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: Constants.fontSizeTiny,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'Buy & Sell Digital SQFT with Verified Users',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Constants.fontSizeTinySmall,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Container(
                            width: Get.width * 0.57,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1C1C1E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dholera Suburban Housing Investment Opportunity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width * 0.25,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          _buildInputField("SQFT Quantity", 60),
                                          const SizedBox(height: 16),
                                          _buildInputField("Market Price", 60),
                                          const SizedBox(height: 16),
                                          _buildInputField("Limit Price", 85),
                                          const SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    // Container(
                                    //   width: Get.width * 0.27,
                                    //   padding: const EdgeInsets.all(16),
                                    //   margin: EdgeInsets.only(top: 20),
                                    //   decoration: BoxDecoration(
                                    //     color: Colors.black,
                                    //     borderRadius: BorderRadius.circular(12),
                                    //   ),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      width: Get.width * 0.27,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.grey.shade800,
                                            width: 2),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          // Total Amount Payable
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Amount Payable",
                                                style: TextStyle(
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                "₹1111.11/-",
                                                style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                              color: Colors.white24,
                                              thickness: 1,
                                              height: 24),
                                          const Text(
                                            "Bulk Discount",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                width: 40,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Container(
                                                width: 30,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.cyan,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("₹10,890.71",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("+₹430.51",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("+₹170.91",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "!! Return are not guaranteed and are subjected to market risks!!",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFA3C3A3), Color(0xFFA3BFE8)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Explore by Regions",
                              style: TextStyle(
                                fontSize: Constants.fontSizeTiny,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: GridView(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  children: [
                                    for (int index = 0;
                                        index < city.length;
                                        index++)
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                    spreadRadius: 2,
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: CircleAvatar(
                                                radius: 120,
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                    location[
                                                        index]), // Yahi main kaam karta hai
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 0),
                                          Text(
                                            city[index],
                                            style: GoogleFonts.aleo(
                                                fontSize: Constants
                                                    .fontSizeTinySmallMini,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Container(
                    height: Get.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Our Board Of Members',
                          style: TextStyle(
                              fontSize: Constants.fontSizeTiny,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              boardMemberController
                                      .boardMembers.value?.data?.length ??
                                  0,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 8),
                                child: TeamMemberCard(
                                  name: boardMemberController.boardMembers.value
                                          ?.data?[index].name ??
                                      "",
                                  role: boardMemberController.boardMembers.value
                                          ?.data?[index].designation ??
                                      "",
                                  imagePath: boardMemberController.boardMembers
                                          .value?.data?[index].image ??
                                      "",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 1,
                          width: Get.width * 0.8,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInputField(String label, double height) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white24),
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12),
    height: height,
    alignment: Alignment.centerLeft,
    child: Text(
      label,
      style: const TextStyle(color: Colors.white70),
    ),
  );
}
