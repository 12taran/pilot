import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Obx(() => propertyController.properties.isNotEmpty
        ? ListView.builder(
            itemCount: propertyController.properties.length,
            itemBuilder: (context, index) {
              return CustomWidgets.propertyCard(
                  propertyController.properties[index],context);
            },
          )
        : const SizedBox());
  }
}
