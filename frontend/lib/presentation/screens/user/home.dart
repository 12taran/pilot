import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/screens/user/profile.dart';
import 'package:pilot_project/routes/page_route.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List City = ['Mohali', 'Bangalore', 'Chennai', 'Hyderabad', 'Panji'];
  List text1 = ['Why use Pilot for Your Investment', '123', '456'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  color: Theme.of(context).colorScheme.primary,
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: Get.height * 0.15,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: IconButton(
                            onPressed: () {
                              Get.to(const ProfilePage());
                            },
                            icon: const Icon(Icons.person)),
                      ),
                      Expanded(
                        child: CarouselSlider(
                            items: [
                              for (int i = 0; i < 5; i++)
                                SizedBox(
                                  //color: Colors.black,
                                  width: Get.width * 0.2,
                                  child: Center(
                                      child: Text(
                                    'profile $i',
                                    style: const TextStyle(color: Colors.white),
                                  )),
                                )
                            ],
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(
                                  seconds:
                                      1), // Time before moving to next slide
                              autoPlayAnimationDuration: const Duration(
                                  seconds: 3), // Slide transition duration
                              autoPlayCurve: Curves.linear,
                            )),
                      )
                    ],
                  )),
              const Divider(
                thickness: 3,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: Get.height * 0.25,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    autoPlayInterval: const Duration(
                        seconds: 5), // Time before moving to next slide
                    autoPlayAnimationDuration:
                        const Duration(seconds: 3), // Slide transition duration
                    //autoPlayCurve: Curves.linear,
                  ),
                  items: [0, 1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: Get.width * 0.7,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      5, 3), // changes position of shadow
                                ),
                              ],
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container());
                      },
                    );
                  }).toList(),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Container(
                child: Column(
                  children: [
                    const Text(
                      "Make your future secure with Pilot 👇",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(items: [
                      for (int i = 0; i < 6; i++)
                        Center(
                            child: Container(
                          width: Get.width / 2,
                          height: Get.height * 0.6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.amberAccent),
                          child: Text(
                            'Property $i',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ))
                    ], options: CarouselOptions()),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      " !! Returns are not guaranteed and are\n subjected to market risks !! ",
                      style: GoogleFonts.aBeeZee(color: Colors.red),
                    ))
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        itemCount: 5,
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
                                    backgroundColor:
                                        Colors.white, // optional for contrast
                                    child: Center(child: Text('$index')),
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
