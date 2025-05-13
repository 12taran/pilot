import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/custom_widgets.dart';

class InvestWPage extends StatefulWidget {
 InvestWPage({super.key});
   

  @override
  State<InvestWPage> createState() => _InvestWPageState();
 
  final dummy=[
  {
    "id": "1",
    "projectName": "Skyline Heights",
    "address": "New Delhi",
    "price": 8500,
    "images": ["https://example.com/image1.jpg"]
  },
  {
    "id": "2",
    "projectName": "Green Valley",
    "address": "Mumbai",
    "price": 9200,
    "images": ["https://example.com/image2.jpg"]
  },
  {
    "id": "3",
    "projectName": "Ocean View",
    "address": "Goa",
    "price": 7800,
    "images": ["https://example.com/image3.jpg"]
  },
  {
    "id": "4",
    "projectName": "Sunset Residency",
    "address": "Jaipur",
    "price": 8100,
    "images": ["https://example.com/image4.jpg"]
  },
  {
    "id": "5",
    "projectName": "Palm Retreat",
    "address": "Chandigarh",
    "price": 8600,
    "images": ["https://example.com/image5.jpg"]
  }
];
  PropertyController propertyController = PropertyController();
}

class _InvestWPageState extends State<InvestWPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Find your favorite property',
             
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 10),
          
          // Beautified property types list using Wrap
          Center(
            child: Container(
              height: Get.height*0.1,
              color: Colors.brown,
              width: Get.width*0.8,
              padding: EdgeInsets.all(16),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < widget.propertyController.types.length; i++)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        widget.propertyController.types[i],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
                      Expanded(
              child: Obx(() {
                
                return GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 0.65, // slightly lower for tighter vertical space
    crossAxisSpacing: 8,
    mainAxisSpacing: 5,
  ),
  itemCount: widget.dummy.length,
  itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.dummy[index]['projectName'] as String,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            widget.dummy[index]['address'] as String,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            '₹${widget.dummy[index]['price']} / sq.ft',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  },
);



               
                /*return ListView.builder(
                  itemCount: widget.propertyController.filteredProperties.length,
                  itemBuilder: (context, index) {
                    return CustomWidgets.propertyCard(
                      widget.propertyController,
                      widget.propertyController.filteredProperties[index],
                      context,
                    );*/
                  },
                )
              
            ),

        ]
      ),
    );
  }
}
