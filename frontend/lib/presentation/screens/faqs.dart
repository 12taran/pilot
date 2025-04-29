import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/faq_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Faqs extends StatefulWidget {
  const Faqs({super.key});

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List<FAQ> faqList = [
    FAQ(
      question: "What does 'liquid state' mean in property selling?",
      answer:
          "In Share Sampatti, selling properties in liquid state means that the property is sold by its per square feet value. You buy only the area you need, not a predefined lot or unit size.",
    ),
    FAQ(
      question: "How is the price calculated?",
      answer:
          "The price of the property is calculated based on the square footage you select. The cost per square foot is predefined and will be multiplied by the area you choose to purchase.",
    ),
    FAQ(
      question: "Can I buy fractional ownership in a property?",
      answer:
          "Yes, you can buy fractional ownership of a property in liquid state, meaning you only pay for the exact square footage you need, which could be a fraction of the entire property.",
    ),
    FAQ(
      question: "How do I know the price per square foot?",
      answer:
          "The price per square foot is listed in the property details. It may vary based on the location and amenities available in the area.",
    ),
    FAQ(
      question: "Is financing available for purchasing the property?",
      answer:
          "Yes, financing options are available through our partner banks. You can apply for a loan directly through the app when making a purchase.",
    ),
    FAQ(
      question: "What are the additional costs involved?",
      answer:
          "Additional costs may include maintenance fees, registration charges, and taxes, which are calculated based on the square footage you purchase.",
    ),
    FAQ(
      question: "Can I sell the property after purchasing it?",
      answer:
          "Yes, you can sell your portion of the property by listing it on Share Sampatti. The transaction will be handled as per the current market value per square foot.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQS',
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont see the answer you are looking for?',
                style: TextStyle(fontSize: 12),
              ),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('8006644389');
                },
                child: Text(
                  'Get in Touch',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    decoration: TextDecoration
                        .underline, // Add this line for the underline
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqList.length,
              itemBuilder: (context, index) {
                return CustomContainer(
                  padding: 0,
                  child: ExpansionTile(
                    title: Text(faqList[index].question),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(faqList[index].answer),
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
