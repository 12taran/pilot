import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/page_route.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to Share Sampatti",
      "desc": " Real estate fractional ownership made easy.",
      "image": "assets/images/motivation1.jpg"
    },
    {
      "title": "Smart Investments",
      "desc": "Invest smartly in properties with low capital.",
      "image": "assets/images/motivation2.jpg"
    },
    {
      "title": "Track & Grow",
      "desc": "Track your investments and see them grow.",
      "image": "assets/images/motivation3.jpg"
    },
    /*{
      "title": "Invest Simplified",
      "desc": "Track your investments and see them grow.",
      "image": "assets/images/motivation1.jpg"
    },*/

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => buildPage(onboardingData[index]),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index),
              ),
            ),
          ),

          // Get Started Button
          if (currentPage == 2)
            Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: CustomButtons(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Get.offAndToNamed(PageRoutes.phonesignup);
                },
                text: "Get Started",
              ),
            ),
          if (currentPage < 2)
            Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: CustomButtons(
                onPressed: () {
                  HapticFeedback.lightImpact();

                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                  // buildPage(onboardingData[currentPage]);
                },
                text: "Next",
              ),
            ),
          if (currentPage < 2)
            Positioned(
              top: 60,
              right: 30,
              child: TextButton(
                child: Text(
                  'Skip',
                  style: GoogleFonts.acme(
                      decoration: TextDecoration.underline,
                      textStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: Constants.fontSizeSubTitle,
                      ),
                      decorationColor:
                          Theme.of(context).textTheme.bodySmall?.color,
                      fontSize: Constants.fontSizeSubTitle),
                ),
                onPressed: () {
                  if (kDebugMode) {
                    print('hello');
                  }
                  pageController.jumpToPage(3);
                },
              ),
            )
        ],
      ),
    );
  }

  Widget buildPage(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.15,
          ),
          Text(
            data["title"]!,
            style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              textStyle: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: Constants.fontSizeHeading * 1.5,
              ),
            ),
            // const TextStyle(
            //     fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            data["desc"]!,
            textAlign: TextAlign.center,
            style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              textStyle: TextStyle(
                color: Theme.of(context).textTheme.labelMedium?.color,
                fontSize: Constants.fontSizeSubTitle,
              ),
            ),
          ),
          SizedBox(height: 20,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              data["image"]!,
              height: Get.height * 0.5,
              width: Get.width * 0.8,
              fit: BoxFit.fill,
            
            ),
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          // Image.asset(
          //   'assets/images/onboarding1.png',
          //   height: Get.height * 0.22,
          //   color: Constants.primaryColor.withBlue(250),
          // )
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 6,
      width: currentPage == index ? 18 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
