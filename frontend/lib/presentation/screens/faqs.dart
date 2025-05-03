import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/help_and_supportController.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.arrow_back_ios_new_rounded))),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary),
            child: Text(
              "FAQs",
              style: GoogleFonts.aBeeZee(
                fontSize: Constants.fontSizeBody,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            'Frequently Asked Questions',
            style: GoogleFonts.aBeeZee(
              fontSize: Constants.fontSizeHeading,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont see the answer you are looking for?',
                style: GoogleFonts.aBeeZee(
                  fontSize: Constants.fontSizeTinySmall,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.find<HelpAndSupportController>()
                      .makePhoneCall('8006644389');
                },
                child: Text(
                  ' Get in Touch',
                  style: GoogleFonts.aBeeZee(
                    fontSize: Constants.fontSizeTinySmall,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                    decorationColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Get.find<HelpAndSupportController>().faqList.length,
              itemBuilder: (context, index) {
                return CustomContainer(
                  backgroundColor: Theme.of(context).cardColor,
                  borderColor: Theme.of(context).dividerColor,
                  borderRadius: 10,
                  padding: 0,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ExpansionTile(
                    title: Text(
                      Get.find<HelpAndSupportController>()
                          .faqList[index]
                          .question,
                      style: GoogleFonts.aBeeZee(
                        fontSize: Constants.fontSizeSmall,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.displayMedium?.color,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          Get.find<HelpAndSupportController>()
                              .faqList[index]
                              .answer,
                          style: GoogleFonts.aBeeZee(
                            fontSize: Constants.fontSizeTiny + 1,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.labelMedium?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
