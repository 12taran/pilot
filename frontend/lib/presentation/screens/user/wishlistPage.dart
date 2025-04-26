import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow_container/glow_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/presentation/controllers/property_controller.dart';
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
                  return Card(
                    color: Theme.of(context).cardColor,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Property Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  item['image']!,
                                  width: Get.width * 0.3,
                                  height: Get.height * 0.15,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 10),

                              // Details + Delete Icon
                              Expanded(
                                child: Stack(
                                  children: [
                                    // Property Details
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right:
                                              35.0), // leave space for delete icon
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(item['name'] ?? '',
                                              style: GoogleFonts.lato(
                                                  fontSize: Constants
                                                      .fontSizeSubTitle,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Icon(
                                                size: 20,
                                                Icons.location_on,
                                                color: Colors.green[300],
                                              ),
                                              Text(item['location'] ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 69, 65, 65))),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GlowContainer(
                                            glowRadius: 8,
                                            gradientColors: [
                                              Colors.white,
                                              Colors.yellow
                                            ],
                                            containerOptions: ContainerOptions(
                                                borderRadius: 10),
                                            child: CustomButtons(
                                                width: Get.width * 0.5,
                                                margin: EdgeInsets.all(0),
                                                text: 'Invest Now',
                                                onPressed: () {
                                                  Map<String, String> detail =
                                                      item;
                                                  Get.toNamed(
                                                      PageRoutes.propertydetail,
                                                      arguments: detail);
                                                }),
                                          )
                                        ],
                                      ),
                                    ),

                                    // Delete Icon at Top Right
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.red[400],
                                        radius: 16,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          iconSize: 16,
                                          icon: const Icon(Icons.delete,
                                              color: Colors.white),
                                          onPressed: () {
                                            propertyController.isFav
                                                .removeAt(index);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
