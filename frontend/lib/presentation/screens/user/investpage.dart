import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

class Investpage extends StatefulWidget {
  const Investpage({super.key});

  @override
  State<Investpage> createState() => _InvestpageState();
}

class _InvestpageState extends State<Investpage> {
  final PropertyController propertyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invest",
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Obx(() => propertyController.properties.isNotEmpty
    ? Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          MyTextField(
            width: Get.width * 0.9,
            isLabelEnabled: false,
            labelText: 'Themes',
            onChanged: (value) {
              // implement search/filter logic here
            },
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: propertyController.properties.length,
              itemBuilder: (context, index) {
                return CustomWidgets.propertyCard(
                  propertyController,
                  propertyController.properties[index],
                  context,
                );
              },
            ),
          ),
        ],
      )
    : const SizedBox())

    );
  }
}
