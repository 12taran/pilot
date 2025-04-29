import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pilot_project/data/models/faq_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndSupportController extends GetxController {
  RxList<FAQ> faqList = [
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
  ].obs;

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
