import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/bottomNavController.dart';
import 'package:pilot_project/presentation/controllers/help_and_supportController.dart';
import 'package:pilot_project/presentation/controllers/pilotController.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/controllers/userController.dart';
import 'package:pilot_project/presentation/widgets/flip_card.dart';
import 'package:pilot_project/presentation/widgets/propertyCard.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:pilot_project/routes/page_route.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List city = ['Mohali', '  Dhulera', 'Himachal'];

  List location = [
    'assets/images/mohali.jpg',
    'assets/images/dholera.jpg',
    'assets/images/chandigarh.jpg'
  ];

  PropertyController propertyController = Get.put(PropertyController());
  Usercontroller usercontroller = Get.find();
  Pilotcontroller pilotcontroller = Get.put(Pilotcontroller());
  BottomNavController bottomNavController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
              color: Colors.black,
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              height: Get.height * 0.08,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // shadow color
                              spreadRadius: 2, // how wide the shadow spreads
                              blurRadius: 6, // softens the shadow
                              offset: const Offset(
                                  0, 4), // shadow position: x (right), y (down)
                            ),
                          ],
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff4c4f5e),
                              Color.fromARGB(255, 200, 202, 213),
                              Color.fromARGB(255, 6, 6, 55),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                PageRoutes.drawerProfile,
                              );
                            },
                            child: Obx(
                              () => Container(
                                width: Get.width * 0.2,
                                height: Get.width *
                                    0.2, // Ensure height matches width for a perfect circle
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${ApiRoutes.imageRoutes}${usercontroller.userImageUrl.value}'),
                                    fit: BoxFit
                                        .cover, // Ensures the image covers the entire container
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    child: CarouselSlider(
                        items: [
                          for (int i = 0; i < 5; i++)
                            CustomContainer(
                              borderRadius: 0,
                              margin: const EdgeInsets.all(0),
                              backgroundColor: Colors.black,
                              width: Get.width * 0.5,
                              height: 0.05,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.currency_rupee,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'KHHIO',
                                        style: GoogleFonts.lateef(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Panther Investors',
                                        style: GoogleFonts.aDLaMDisplay(
                                            color: Color.fromARGB(
                                                255, 140, 227, 99),
                                            fontSize: 10),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 0.5,
                          height: Get.height * 0.08,
                          autoPlay: true,
                          autoPlayInterval: const Duration(
                              seconds: 1), // Time before moving to next slide
                          autoPlayAnimationDuration: const Duration(
                              seconds: 3), // Slide transition duration
                          autoPlayCurve: Curves.linear,
                        )),
                  )
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 75, 138, 75),
                    Color.fromARGB(255, 44, 121, 39),
                    Color.fromARGB(255, 37, 72, 33),
                  ]),
                  border: Border.all(
                    color: const Color.fromARGB(255, 107, 106, 106),
                    width: 0.5,
                  )),
              height: Get.height * 0.2,
              width: Get.width * 0.9,
              child:Stack(
  children: [
    // Background layer (can be a color, gradient, or image)
   

    // Foreground content: logo + text
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/icon/logo.png',
              height: Get.height * 0.12,
              width: Get.width * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          
          Text(
            "Investing in Real Estate \nmade easy for everyone",
            textAlign: TextAlign.center,
            style: GoogleFonts.aleo(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 251, 245, 245),
            ),
          ),
        ],
      ),
    ),
  ],
)

            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover for ${Get.find<Usercontroller>().userDetail.value.fullname ?? "USER"}",
                      style: GoogleFonts.lato(
                          fontSize: Constants.fontSizeExtraLarge,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.bodyLarge?.color),
                    ),
                    Text(
                      "Start Investing Securely 🔒",
                      style: GoogleFonts.lato(
                          fontSize: Constants.fontSizeSmall,
                          color: Theme.of(context).textTheme.bodyMedium?.color),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                  items: [
                    for (int i = 0;
                        i < propertyController.properties.length;
                        i++)
                      Center(
                          child: PropertyCard(
                              property: propertyController.properties[i]))
                  ],
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.9,
                      enlargeCenterPage: false,
                      height: Get.height * 0.4)),
              Center(
                  child: Text(
                " !! Returns are not guaranteed and are subjected to market risks !! ",
                style: GoogleFonts.lato(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: Constants.fontSizeTiny),
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 190, 204, 215),
                  Color.fromARGB(255, 146, 182, 118),
                  Color.fromARGB(255, 173, 194, 173)
                ])),
                height: Get.height * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Explore by Regions',
                        style: GoogleFonts.aleo(
                            fontSize: Constants.fontSizeHeading,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Expanded(
                      child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          children: [
                            for (int index = 0; index < 3; index++)
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      propertyController.selectedLocation
                                          .value = city[index]; // Selected type
                                      bottomNavController.changeTabIndex(2);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(location[
                                            index]), // Yahi main kaam karta hai
                                      ),
                                    ),
                                  ),
                                  Text(
                                    city[index],
                                    style: GoogleFonts.aleo(
                                        fontSize: Constants.fontSizeSmall,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                height: Get.height * 0.4,
                child: Column(
                  children: [
                    Text(
                      'Our Board Of Members',
                      style: TextStyle(
                          fontSize: Constants.appBarTextSize,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: Get.height * 0.28,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          scrollPhysics: const BouncingScrollPhysics(),
                          pageSnapping: false,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8),
                      items: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlipCard(
                              index: index,
                              boardMember: pilotcontroller.boardMembers[index]),
                        );
                        // Container(
                        //   width: Get.width * 0.9,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5),
                        //     color: const Color.fromARGB(255, 211, 223, 212),
                        //   ),
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       //SizedBox(height: Get.height * 0.015), // 1.5% of screen height
                        //       Row(
                        //         //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           Expanded(
                        //             flex: 7,
                        //             child: Center(
                        //               child: ClipRRect(
                        //                 borderRadius: BorderRadius.circular(2),
                        //                 child: Image.asset(
                        //                   pilotcontroller.boardMembers[index]
                        //                       ['image']!,
                        //                   fit: BoxFit.fill,
                        //                   height: Get.height * 0.278,
                        //                   width: Get.width * 0.6,
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //               width: Get.width *
                        //                   0.02), // Space between image and text
                        //           Expanded(
                        //             flex: 5, // To avoid text overflow
                        //             child: Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               crossAxisAlignment: CrossAxisAlignment
                        //                   .center, // Left align
                        //               children: [
                        //                 Text(
                        //                   pilotcontroller.boardMembers[index]
                        //                       ['name']!,
                        //                   textAlign: TextAlign.center,
                        //                   maxLines: 2,
                        //                   style: GoogleFonts.actor(
                        //                     fontSize: Constants.fontSizeBody,
                        //                     fontWeight: FontWeight.w900,
                        //                     color: const Color.fromARGB(
                        //                         255, 26, 24, 24),
                        //                   ),
                        //                   overflow: TextOverflow
                        //                       .ellipsis, // To prevent overflow
                        //                 ),
                        //                 Text(
                        //                   pilotcontroller.boardMembers[index]
                        //                       ['designation']!,
                        //                   textAlign: TextAlign.center,
                        //                   maxLines: 2,
                        //                   style: GoogleFonts.actor(
                        //                     fontSize: Constants.fontSizeTiny,
                        //                     fontWeight: FontWeight.w500,
                        //                     color: const Color.fromARGB(
                        //                         255, 31, 31, 31),
                        //                   ),
                        //                   overflow: TextOverflow.ellipsis,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // );
                      }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  width: Get.width * 0.95,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 107, 106, 106),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 2)],
                      color: Color.fromARGB(255, 236, 233, 233)),
                  height: Get.height * 0.2,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/images/invest.png',
                          fit: BoxFit.fill,
                          height: Get.height * 0.2,
                          width: Get.width * 0.95,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(' The smart way to invest in assets',
                              style: TextStyle(
                                  fontSize: Constants.fontSizeSubTitle,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 2, 2, 72))),
                          Text('fractionally, securely, profitably',
                              style: TextStyle(
                                  fontSize: Constants.fontSizeSubTitle,
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
                              borderRadius: 10,
                              margin: const EdgeInsets.all(0),
                              color: Colors.white,
                              textColor:Colors.greenAccent,
                          
                              text: 'Invest Now',
                              onPressed: () {
                                print('Hello');
                                bottomNavController.changeTabIndex(2);
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                height: Get.height * 0.23,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Explore by Themes',
                        style: GoogleFonts.aleo(
                            fontSize: Constants.fontSizeHeading,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int index = 0; index < 3; index++)
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    propertyController.selectedType.value =
                                        propertyController.properties[index]
                                            .type; // Selected type
                                    bottomNavController.changeTabIndex(2);
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
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        propertyController
                                            .properties[index].image!,
                                      ), // Yahi main kaam karta hai
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  propertyController.properties[index].type!,
                                  style: GoogleFonts.aleo(
                                      fontSize: Constants.fontSizeSmall,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
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
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 75, 138, 75),
                        Color.fromARGB(255, 44, 121, 39),
                        Color.fromARGB(255, 37, 72, 33),
                      ])),
                  height: Get.height * 0.2,
                  width: Get.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          fontSize: Constants.fontSizeSubTitle,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                ),
                                Text('your dream Investment',
                                    style: GoogleFonts.aleo(
                                        fontSize: Constants.fontSizeSubTitle,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                CustomButtons(
                                  width: Get.width * 0.4,
                                  color: Color.fromARGB(255, 144, 224, 113),
                                  textColor: Colors.white,
                                  borderRadius: 20,
                                  text: 'Call Us',
                                  onPressed: () {
                                    Get.find<HelpAndSupportController>()
                                        .makePhoneCall('8006644389');
                                  },
                                )
                              ],
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
