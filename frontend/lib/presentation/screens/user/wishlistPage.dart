import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
import 'package:pilot_project/presentation/widgets/propertyCard.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:pilot_project/routes/page_route.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  PropertyController propertyController = Get.put(PropertyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: GoogleFonts.acme(fontSize: Constants.appBarTextSize),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Obx(() {
        return propertyController.isFav.isEmpty
            ? Center(child: Text("Your wishlist is empty",style: GoogleFonts.aleo(fontSize: Constants.appBarTextSize),))
            : ListView.builder(
                itemCount: propertyController.isFav.length,
                itemBuilder: (context, index) {
                  final item = propertyController.isFav[index];
                  return PropertyCard(
                    property: item,
                  
                  );
                },
              );
      }),
    );
  }
}


/*
class WishlistPage extends StatelessWidget {
WishlistPage({super.key});
  PropertyController propertyController=Get.put(PropertyController());

  // Mock data - you can replace this with your provider or backend list
  final List<Map<String, String>> wishlistItems = const [
    {
      'title': 'Luxury Villa',
      'location': 'Goa',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Beach House',
      'location': 'Kerala',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Mountain Cabin',
      'location': 'Manali',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: wishlistItems.isEmpty
          ? const Center(
              child: Text('Your wishlist is empty.'),
            )
          : Obx((){
            return ListView.builder(
                itemCount: propertyController.isFav.length,
                itemBuilder: (context, index) {
                  final item = propertyController.isFav[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.asset(
                        item['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['name']!),
                      subtitle: Text(item['location']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  );
                }
              );}
          ),
    );
  }
}*/
