import 'package:get/get.dart';

class Pilotcontroller extends GetxController {
  List<Map<String, String>> boardMembers = [
    {
      "name": "Mrs Anjum",
      "designation": "Chairperson",
      "image": "assets/images/chairman.jpg",
    },
    {
      "name": "Mr. Himanshu",
      "designation": "Vice Chairperson",
      "image": "assets/images/vice_chairperson.jpg",
    },
    /*{
    "name": "Mr. Karam VirRajpal",
    "designation": "Ex CDO",
     "image": "assets/images/property1.jpg",
  },*/
    {
      "name": "Mr. Vinay Sethi",
      "designation": "Director",
      "image": "assets/images/director.jpg",
    },
  ];

  final List<Map<String, String>> benefits = [
    {
      "title": "Reduce risk",
      "description":
          "By diversifying your investments into a portfolio of real estate assets",
    },
    {
      "title": "Convenience",
      "description": "Easy to buy & sell, 1 SQFT at a time",
    },
    {
      "title": "Hassle Free",
      "description":
          "Professional Property Management Services by Master Property Manager (MPM)",
    },
    {
      "title": "Long Term Profits",
      "description": "Long term capital appreciation",
    },
  ];
}
