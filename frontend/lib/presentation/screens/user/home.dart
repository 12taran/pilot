import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/controllers/pilotController.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/routes/page_route.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List City = ['Mohali', '  Dhulera', 'Himachal'];

  List location = [
    'assets/images/kasol.jpg',
    'assets/images/chandigarh.jpg',
    'assets/images/kasol.jpg'
  ];
  List<String> motivation = [
    "assets/images/motivation1.jpg",
    "assets/images/motivation2.jpg",
    "assets/images/motivation3.jpg",
  ];
  PropertyController propertyController = Get.put(PropertyController());
  Pilotcontroller pilotcontroller = Get.put(Pilotcontroller());
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
              color: Theme.of(context).colorScheme.primary,
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              height: Get.height * 0.1,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Container(
                        width: 50,
                        height: 50,
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
                              Get.to(
                                const ProfilePage(),
                                transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                            child: Text(
                              'Pilot',
                              style: GoogleFonts.aBeeZee(
                                fontSize: Constants.fontSizeBody,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 246, 241,
                                    241), // Make sure text is visible on gradient
                              ),
                            ),
                          ),
                        ),
                      )),
                  // Expanded(
                  //   child: CarouselSlider(
                  //       items: [
                  //         for (int i = 0; i < 5; i++)
                  //           Expanded(
                  //             child: CustomContainer(
                  //               borderRadius: 0,
                  //               margin: const EdgeInsets.all(0),
                  //               backgroundColor: Colors.black,
                  //               width: Get.width * 0.7,
                  //               child: Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   const Icon(
                  //                     Icons.currency_rupee,
                  //                     color: Colors.orange,
                  //                     size: 30,
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Text(
                  //                         'Stock $i',
                  //                         style: GoogleFonts.lateef(
                  //                             color: Colors.white,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 15),
                  //                       ),
                  //                       Text(
                  //                         'Panther Investors',
                  //                         style: GoogleFonts.aDLaMDisplay(
                  //                             color: Colors.green,
                  //                             fontSize: 5),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //       ],
                  //       options: CarouselOptions(
                  //         viewportFraction: 0.5,
                  //         height: Get.height * 0.08,
                  //         autoPlay: true,
                  //         autoPlayInterval: const Duration(
                  //             seconds: 1), // Time before moving to next slide
                  //         autoPlayAnimationDuration: const Duration(
                  //             seconds: 3), // Slide transition duration
                  //         autoPlayCurve: Curves.linear,
                  //       )),
                  // )
                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: Get.width,
            height: Get.height * 0.25,
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(
                    seconds: 5), // Time before moving to next slide
                autoPlayAnimationDuration:
                    const Duration(seconds: 3), // Slide transition duration
                //autoPlayCurve: Curves.linear,
              ),
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Image.asset(
                          motivation[i],
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 25,
                          right: 10,
                          child: CustomButtons(
                            borderRadius: 20,
                            color: Colors.orange,
                            fontSize: Constants.fontSizeTinySmall,
                            width: Get.width * 0.3,
                            onPressed: () {},
                            text: 'Invest Now',
                          ),
                        )
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Discover ",
                      style: GoogleFonts.lato(
                          fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      " Start Investing Securely 🔒",
                      style:
                          GoogleFonts.lato(fontSize: Constants.fontSizeHeading),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                  items: [
                    for (int i = 0; i < 6; i++)
                      Center(
                          child: CustomContainer(
                        backgroundColor:
                            const Color.fromARGB(255, 203, 202, 200),
                        padding: 2,
                        width: Get.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: Image.asset(
                                propertyController.properties[i]['image']!,
                                fit: BoxFit.cover,
                                height: Get.height * 0.2,
                                width: Get.width * 0.9,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  propertyController.properties[i]['name']!,
                                  style: GoogleFonts.actor(
                                      fontSize: Constants.fontSizeBody,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 164, 227, 127),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    propertyController.properties[i]['type']!,
                                    style: TextStyle(
                                        fontSize: Constants.fontSizeTiny,
                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 16, color: Colors.red),
                                const SizedBox(width: 4),
                                Text(
                                  propertyController.properties[i]['location']!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 46, 47, 46)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Rs ${propertyController.properties[i]['price']!}/- ",
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
                                  // const SizedBox(height: 10),
                                  Center(
                                      child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Invest Now',
                                      style: GoogleFonts.labrada(
                                        fontSize: Constants.fontSizeSubTitle,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 230, 110, 19),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                  ],
                  options: CarouselOptions(
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      height: Get.height * 0.36)),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                " !! Returns are not guaranteed and are subjected to market risks !! ",
                style: GoogleFonts.lato(
                    color: Colors.red, fontSize: Constants.fontSizeTiny),
              ))
            ],
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 38, 93, 40),
                                  Color.fromARGB(255, 83, 152, 85),
                                  Color.fromARGB(255, 173, 194, 173)
                                ])),
                            child: const Icon(Icons.person),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "10k+",
                                style: TextStyle(
                                    fontSize: Constants.fontSizeSubTitle,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Users",
                                style: TextStyle(
                                    fontSize: Constants.fontSizeSmall,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(colors: [
                                  Color.fromARGB(255, 38, 93, 40),
                                  Color.fromARGB(255, 83, 152, 85),
                                  Color.fromARGB(255, 173, 194, 173)
                                ])),
                            child: const Icon(Icons.location_city),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "8 Cities",
                            style: TextStyle(
                                fontSize: Constants.fontSizeSubTitle,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 59, 127, 60),
                  Color.fromARGB(255, 116, 185, 118),
                  Color.fromARGB(255, 173, 194, 173)
                ])),
                height: Get.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Explore by Regions',
                        style: TextStyle(
                            fontSize: Constants.fontSizeHeading,
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
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Container(
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
                                    Text(
                                      City[index],
                                      style: TextStyle(
                                          fontSize: Constants.fontSizeTiny),
                                    ),
                                  ],
                                ),
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
                height: Get.height * 0.5,
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
                        height: Get.height * 0.35,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        aspectRatio: 2 / 3,
                      ),
                      items: List.generate(4, (index) {
                        return Container(
                          height: Get.height * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          //height: Get.height*0,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.asset(
                                    propertyController.properties[index]
                                        ['image']!,
                                    fit: BoxFit.cover,
                                    height: Get.height * 0.2,
                                    width: Get.width * 0.7,
                                  ),
                                ),
                                const Divider(
                                    thickness: 1,
                                    color: Color.fromARGB(255, 185, 206, 202)),
                                Text(
                                  pilotcontroller.boardMembers[index]['name']!,
                                  style: GoogleFonts.actor(
                                      fontSize: Constants.fontSizeSmall,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Text(
                                  pilotcontroller.boardMembers[index]
                                      ['designation']!,
                                  style: GoogleFonts.actor(
                                      fontSize: Constants.fontSizeBody,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                       LinearGradient(colors: [Color.fromARGB(255, 59, 100, 127),Color.fromARGB(255, 166, 186, 107),Color.fromARGB(255, 173, 194, 173)])),
                    height: Get.height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 20),
                    child: Text('Explore by Themes',style: TextStyle(fontSize:Constants.fontSizeHeading,fontWeight: FontWeight.w800),),
                                    ),
                                    SizedBox(height: Get.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int index = 0; index < 3; index++)
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Container(
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
                                    Text(
                                      propertyController.properties[index]
                                          ['type']!,
                                      style: TextStyle(
                                          fontSize: Constants.fontSizeSmall,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                          ])
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [Color.fromARGB(255, 173, 194, 173),Color.fromARGB(255, 166, 185, 107),Color.fromARGB(255, 59, 100, 127),])),
                    height: Get.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //SizedBox(width: Get.width*0.1,),
                            const CircleAvatar(
                                radius: 50,
                                child: Icon(
                                  Icons.call,
                                  size: 80,
                                )),
                            Column(
                              children: [
                                Text(
                                    'Give us a Call to help you\n get started with your real \nestate investments',
                                    style: TextStyle(
                                        fontSize: Constants.fontSizeBody,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                            255, 28, 26, 35))),
                                CustomButtons(
                                    color: Colors.white,
                                    textColor: Colors.orange,
                                    width: Get.width * 0.4,
                                    text: 'Call Us',
                                    onPressed: () {})
                              ],
                            )
                          ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
