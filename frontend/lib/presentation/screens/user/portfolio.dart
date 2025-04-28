import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomContainer(
            borderColor: Theme.of(context).colorScheme.primary,
            padding: 0,
            margin: const EdgeInsets.all(10),
            backgroundColor: Theme.of(context).colorScheme.background,
            height: Get.height * 0.27,
            width: double.infinity,
            child: Stack(
              children: [
                // Positioned(
                //     bottom: 0,
                //     right: 10,
                //     child: Text(
                //       "Portfolio",
                //       style: GoogleFonts.acme(
                //           fontSize: 35,
                //           fontWeight: FontWeight.w900,
                //           color: Colors.black26),
                //       textAlign: TextAlign.start,
                //     )),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    children: [
                      Text(
                        'Current Value',
                        style: GoogleFonts.aleo(
                            fontSize: Constants.fontSizeSubTitle,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${Constants.rupeeSymbol} 14,000,900',
                        style: GoogleFonts.acme(
                          fontSize: Constants.fontSizeExtraLarge,
                          color: Colors.green,
                        ),
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
                            color: Theme.of(context).textTheme.bodyLarge?.color,
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
                  bottom: 40,
                  left: 20,
                  child: Column(
                    children: [
                      Text(
                        'Invested',
                        style: GoogleFonts.aleo(
                            fontSize: Constants.fontSizeSubTitle,
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${Constants.rupeeSymbol} 6,57,30,524',
                        style: GoogleFonts.acme(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: Constants.fontSizeExtraLarge,
                          // color: Colors.green),
                        ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        'Properties  ',
                        style: GoogleFonts.aleo(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: Constants.fontSizeSubTitle,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '2',
                        style: GoogleFonts.acme(
                            textStyle: Theme.of(context).textTheme.displayLarge,
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
                      color: Colors.green,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomWidgets.portfolioCard(context, index);
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
