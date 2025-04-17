import 'package:flutter/material.dart';
import 'package:pilot_project/core/config.dart';

class CustomWidgets {
  static Widget propertyCard(
      Map<String, String> property, BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Property Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                property['image']!,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // Property Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property['name']!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Price: ${Constants.rupeeSymbol}${property['price']}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      child: const Text("Invest Now"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
