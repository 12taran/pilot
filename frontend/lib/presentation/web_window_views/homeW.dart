import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/board_member.dart';
import 'package:pilot_project/presentation/controllers/boardmember_controller.dart';
import 'package:pilot_project/presentation/controllers/help_and_supportController.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.min,
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
                                      horizontal: 40, vertical: 8),
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
                          
                    
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness:2),
                  SizedBox(height: Get.height*0.15,),
                      Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: Container(
                    width: Get.width * 0.8,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 107, 106, 106),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 2)],
                        color: Color.fromARGB(255, 236, 233, 233)),
                    height: Get.height * 0.5,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/invest.png',
                            fit: BoxFit.fill,
                            height: Get.height * 0.5,
                            width: Get.width * 0.95,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' The smart way to invest in assets',
                                style: TextStyle(
                                    fontSize: Constants.fontSizeTiny,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 2, 2, 72))),
                            Text('fractionally, securely, profitably',
                                style: TextStyle(
                                    fontSize: Constants.fontSizeTiny,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromARGB(255, 2, 2, 72))),
                            const SizedBox(
                              height: 20,
                            ),
                            GlowContainer(
                              containerOptions: const ContainerOptions(
                                  borderRadius: 10,
                                  borderSide: BorderSide(width: 2)),
                              // optional, or customize
                              gradientColors: const [
                                Colors.yellow,
                                Colors.green,
                                Colors.greenAccent,
                              ],
                              glowRadius: 5,
                              // match button's border
                              child: CustomButtons(
                                width: Get.width * 0.7,
                                borderRadius: 12,
                                margin: const EdgeInsets.all(0),
                                color: Colors.white,
                                textColor: Colors.greenAccent,
                                text: 'Invest Now',
                                onPressed: () {
                                  print('Hello');
                                
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                            SizedBox(height:Get.height*0.1),
              /*SizedBox(
                height: Get.height * 0.01,
              ),*/
              Container(
                //borderRadius: BorderRadius.circular(20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 190, 204, 215),
                  Color.fromARGB(255, 146, 182, 118),
                  Color.fromARGB(255, 173, 194, 173)
                ])),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Explore by Themes',
                        style: GoogleFonts.aleo(
                            fontSize: Constants.fontSizeSmall,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int index = 0;
                              index < propertyController.types.length;
                              index++)
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    propertyController.selectedType.value =
                                        propertyController
                                            .types[index]; // Selected type
                                    
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        location[index],
                                      ), // Yahi main kaam karta hai
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  propertyController.types[index],
                                  style: GoogleFonts.aleo(
                                      fontSize: Constants.fontSizeTiny,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                        ])
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 75, 138, 75),
                          Color.fromARGB(255, 44, 121, 39),
                          Color.fromARGB(255, 37, 72, 33),
                        ])),
                    
                    width: Get.width * 0.9,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Text(
                                        maxLines: 2,
                                        "You are just a call away from ",
                                        style: GoogleFonts.aleo(
                                            fontSize: Constants.fontSizeTinySmall,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                                  Text('your dream Investment',
                                      style: GoogleFonts.aleo(
                                          fontSize: Constants.fontSizeTinySmall,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: GlowContainer(
                                      
                                      gradientColors: [Colors.purple],
                                      glowRadius: 20,
                                      containerOptions: ContainerOptions(padding: EdgeInsets.all(0),borderRadius: 20),
                                      child: CustomButtons(
                                        width: Get.width * 0.3,
                                        height: Get.height * 0.08,
                                        margin: EdgeInsets.all(0),
                                        color: Color.fromARGB(255, 228, 116, 224),
                                        textColor: Colors.white,
                                        borderRadius: 20,
                                        text: 'Call Us',
                                        onPressed: () {
                                          Get.find<HelpAndSupportController>()
                                              .makePhoneCall('8006644389');
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
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
