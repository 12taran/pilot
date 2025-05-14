import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/routes/api_routes.dart';

class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.39,
      width: Get.width * 0.25,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left Side: Image
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.brown.shade300,
                image: DecorationImage(
                  image: NetworkImage('${ApiRoutes.imageRoutes}${imagePath}'),
                  fit: BoxFit
                      .fill, // Ensures the image covers the entire container
                ),
              ),
            ),
          ),
          // Right Side: Name & Role
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal.shade100,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    role,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
