import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/routes/page_route.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List City = ['Mohali', '  Dhulera', 'Himachal'];
  List text1 = ['Why use Pilot for Your Investment', '123', '456'];
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
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(
                                const ProfilePage(),
                                transition: Transition
                                    .leftToRight, // 👈 smooth left-to-right animation
                                duration: const Duration(
                                    milliseconds: 300), // optional
                              );
                            },
                            icon: const Icon(Icons.person)),
                      ),
                    ),
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
                          ),
                          Positioned(
                            child: CustomButtons(
                              fontSize: 10,
                              width: Get.width * 0.4,
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
                Text(
                  "   Make your future secure with Pilot 👇",
                  style: GoogleFonts.lato(fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                    items: [
                      for (int i = 0; i < 6; i++)
                        Center(
                            child: CustomContainer(
                          padding: 2,
                          width: Get.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  propertyController.properties[i]['image']!,
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.16,
                                  width: Get.width * 0.9,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    propertyController.properties[i]['name']!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      propertyController.properties[i]['type']!,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black54),
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
                                    propertyController.properties[i]
                                        ['location']!,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('PRICE : ',
                                          style: GoogleFonts.lato(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        "₹ ${propertyController.properties[i]['price']!}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 75, 92, 217),
                                              Color.fromARGB(255, 99, 195, 240),
                                              Color.fromARGB(255, 193, 185, 236)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              blurRadius: 12,
                                              offset: const Offset(4, 6),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              // Do something here
                                            },
                                            child: Container(
                                              width: Get.width * 0.3,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Invest',
                                                  style: GoogleFonts.labrada(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    letterSpacing: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
                  style: GoogleFonts.lato(color: Colors.red, fontSize: 12),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              child: const Icon(Icons.person),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "10k+",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Users",
                                  style: TextStyle(fontSize: 18),
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
                                color: Colors.grey,
                              ),
                              child: const Icon(Icons.location_city),
                            ),
                            const Column(
                              children: [
                                Text(
                                  "8",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "Cities",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                ),
                SizedBox(
                  height: Get.height * 0.5,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
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
                                  backgroundImage: AssetImage(location[
                                      index]), // Yahi main kaam karta hai
                                ),
                              ),
                              Text(
                                City[index],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
