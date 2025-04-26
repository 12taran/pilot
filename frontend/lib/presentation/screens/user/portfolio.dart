import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Portfolio",
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        centerTitle: true,
      ),
      body: CustomContainer(
        borderColor: Theme.of(context).colorScheme.surface,
        padding: 0,
        margin: const EdgeInsets.all(10),
        //  backgroundColor: Colors.black,
        height: Get.height * 0.3,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 10,
                child: Text(
                  "Portfolio",
                  style: GoogleFonts.acme(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Colors.black26),
                  textAlign: TextAlign.start,
                )),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                children: [
                  Text(
                    'Current Value',
                    style: GoogleFonts.aleo(
                        fontSize: Constants.fontSizeSubTitle,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${Constants.rupeeSymbol} 14,000,900',
                    style: GoogleFonts.acme(
                        fontSize: Constants.fontSizeExtraLarge,
                        color: Colors.green),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Column(
                children: [
                  Text(
                    'Overall Return',
                    style: GoogleFonts.aleo(
                        fontSize: Constants.fontSizeSubTitle,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/increase.png',
                        height: 25,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '49.9%',
                        style: GoogleFonts.acme(
                            fontSize: Constants.fontSizeExtraLarge,
                            color: Colors.green),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: 20,
              child: Column(
                children: [
                  Text(
                    'Invested',
                    style: GoogleFonts.aleo(
                        fontSize: Constants.fontSizeSubTitle,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${Constants.rupeeSymbol} 6,57,305.24',
                    style: GoogleFonts.acme(
                      fontSize: Constants.fontSizeExtraLarge,
                      // color: Colors.green),
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              right: 20,
              child: Column(
                children: [
                  Text(
                    'Properties   ',
                    style: GoogleFonts.aleo(
                        fontSize: Constants.fontSizeSubTitle,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '🏡  2',
                    style: GoogleFonts.acme(
                        fontSize: Constants.fontSizeExtraLarge,
                        color: Colors.green),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.3, // 0.0 = fully transparent, 1.0 = fully opaque
                child: Image.asset(
                  'assets/images/cropped-portfolio_background.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
