import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glow_container/glow_container.dart';
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
              color:Colors.black,
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
                              Get.to(
                                const ProfilePage(),
                                transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                            child: Icon(Icons.person)
                            
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
                                            color: Color.fromARGB(255, 140, 227, 99),
                                            fontSize:10),
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
              SizedBox(height: 10,),
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
                      boxShadow: [BoxShadow(spreadRadius: 1,blurRadius: 5)],
                      border: Border.all(
                        color: const Color.fromARGB(255, 107, 106, 106),
                        width:0.5,
                      )),
                  height: Get.height * 0.2,
                  width: Get.width*0.95,
                  child: Stack(
                    children: [
                      Positioned(left: 0,bottom:0,
                        child:Image.asset('assets/images/women.png',
                        fit: BoxFit.fill,
                        height: Get.height * 0.2,
                        width: Get.width*0.3,)),
                      /*Positioned(
                        right: 20,bottom:40,
                        child: Text('Share Sampatti',
                            style: GoogleFonts.acme(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,

                                color:Color.fromARGB(255, 236, 236, 224)// const Color.fromARGB(255, 129, 125, 125)
                                )),
                      ),*/
                      Positioned(
                        top: 30,right:10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /*Text('Invest in Real estate Easily',
                              style: GoogleFonts.aleo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white)
                                  ),*/
                                  Text(   style: GoogleFonts.aleo(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 251, 245, 245)),  "Real Estate for Everyone.",),
                            
                          ],
                        ),
                      ),]
                  ),
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
                          fontSize: 35, fontWeight: FontWeight.w700,color:Color.fromARGB(255, 12, 3, 113)),
                    ),
                    Text(
                      " Start Investing Securely 🔒",
                      style:
                          GoogleFonts.lato(fontSize: Constants.fontSizeHeading,color: Color.fromARGB(255, 49, 18, 171)),
                    ),
                  ],
                ),
              ),
              
              CarouselSlider(
                  items: [
                    for (int i = 0; i < 6; i++)
                      Center(
                          child: CustomContainer(
                        backgroundColor:
                            Color.fromARGB(255, 239, 238, 237),
                        padding: 0,
                        borderWidth: 3,
                        borderRadius: 10,
                        width: Get.width * 0.9,
                        height: Get.height*0.34,
                        borderColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,top:4),
                                  child: Text(
                                    propertyController.properties[i]['name']!,
                                    style: GoogleFonts.almarai(
                                      color: Color.fromARGB(255, 49, 18, 171),
                                        fontSize: Constants.fontSizeBody,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),]),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Rs ${propertyController.properties[i]['price']!}/- ",
                                        style: GoogleFonts.andika(
                                            fontSize: Constants.fontSizeSubTitle,
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromARGB(255, 49, 18, 171)
                                                ),
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Per',
                                            style: TextStyle(
                                              fontSize:12 ,
                                                color:  Color.fromARGB(255, 49, 18, 171)
                                                    ),
                                          ),
                                          Text(
                                            'SQFT',
                                            style: TextStyle(
                                              fontSize: 12,
                                                color: Color.fromARGB(255, 49, 18, 171)
                                                    ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  // const SizedBox(height: 10),
                                  Center(
                                      child: GestureDetector(
                                    onTap: () {
                                      print('Invest now1');
                                      Map<String, String> detail =
                                          propertyController.properties[i];
                                      Get.toNamed(PageRoutes.propertydetail,
                                          arguments: detail);
                                    },
                                    child: Text(
                                      'Invest Now',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: Constants.fontSizeSmall,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 232, 125, 43),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: Image.asset(
                                  propertyController.properties[i]['image']!,
                                  fit: BoxFit.cover,
                                  height: Get.height * 0.22,
                                  width: Get.width * 0.9,
                                ),
                              ),
                            ),
                          
                           
                            
                            
                          
                            
                            ]
                        )))
                  ],
                        
                  
                  options: CarouselOptions(
                      viewportFraction: 0.9,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 9,
                      height: Get.height * 0.4)),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                " !! Returns are not guaranteed and are subjected to market risks !! ",
                style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 105, 104, 104), fontSize: Constants.fontSizeTiny),
              ))
            ],
          ),
         SizedBox(height: 10,),
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
                      padding: const EdgeInsets.only(left: 20.0,top: 20),
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
                              Column(
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
                                        fontSize: Constants.fontSizeSmall,
                                        fontWeight: FontWeight.w700),
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
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: false,
                        aspectRatio: 16/11,
                      ),
                      items: List.generate(3, (index) {
                        return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: const Color.fromARGB(255, 211, 223, 212),
  ),
  child: Padding(
    padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: Get.height * 0.015), // 1.5% of screen height
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                propertyController.properties[index]['image']!,
                fit: BoxFit.cover,
                height: Get.height * 0.23,
                width: Get.width * 0.4,
              ),
            ),
          SizedBox(width: Get.width * 0.02), // Space between image and text
            Expanded( // To avoid text overflow
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, // Left align
                children: [
                  Text(
                    pilotcontroller.boardMembers[index]['name']!,
                    style: GoogleFonts.actor(
                      fontSize: Constants.fontSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 26, 24, 24),
                    ),
                    overflow: TextOverflow.ellipsis, // To prevent overflow
                  ),
                  Text(
                    pilotcontroller.boardMembers[index]['designation']!,
                    style: GoogleFonts.actor(
                      fontSize: Constants.fontSizeBody,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromARGB(255, 31, 31, 31),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
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

               Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(spreadRadius: 1,blurRadius: 5)],
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 75, 138, 75),
                        Color.fromARGB(255, 44, 121, 39),
                        Color.fromARGB(255, 37, 72, 33),
                
                        
                      ])),
                  height: Get.height * 0.2,
                  width: Get.width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           
                            Column(
                              children: [
                                Text(
                                    "Let's Connect to get you\n Started with PILOT",
                                    style: TextStyle(
                                        fontSize: Constants.fontSizeSmall,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                                CustomButtons(
                                  borderRadius: 20,
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
              ),
              SizedBox(
                height: 20
              ),
              /*SizedBox(
                height: Get.height * 0.01,
              ),*/
              Container(
                decoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 197, 239, 220)
                ),
                height: Get.height * 0.23,
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'Explore by Themes',
                        style: TextStyle(
                            fontSize: Constants.fontSizeHeading,
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
                        ])
                  ],
                ),
              ),
             
              
              SizedBox(
                height: 20
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  width: Get.width*0.95,
                  decoration: BoxDecoration(
                     border: Border.all(
    color: const Color.fromARGB(255, 107, 106, 106),
    width:0.5,
  ),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      boxShadow: [BoxShadow(spreadRadius: 1,blurRadius:2)],
                     color: Color.fromARGB(255, 236, 233, 233)
                      ),
                  height: Get.height * 0.2,
                  child: Stack(
                    alignment:Alignment.topCenter,
                    children: [
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(' Invest in Real estate Easily',
                              style: TextStyle(
                                  fontSize: Constants.fontSizeSubTitle,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(255, 2, 2, 72))),
                          const SizedBox(
                            height: 20,
                          ),
                          GlowContainer(
                            containerOptions:
                                const ContainerOptions(borderRadius: 10,borderSide: BorderSide(width: 2)
                                ),
                            // optional, or customize
                            gradientColors: const [
                              Colors.orange,
                              Color.fromARGB(255, 221, 96, 58),
                              
                            ],
                            glowRadius: 5,
                            // match button's border
                            child: CustomButtons(
                              width: Get.width * 0.7,
                              borderRadius: 10,
                              margin: const EdgeInsets.all(0),
                              color: Colors.white,
                              textColor: Colors.orange,
                              text: 'Invest Now',
                              onPressed: () {
                                print('Hello');
                                Get.toNamed(PageRoutes.invest,
                                    );
                              },
                            ),
                          )
                        ],
                      ),
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
