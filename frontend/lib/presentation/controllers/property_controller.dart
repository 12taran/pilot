import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/data/models/property_model.dart';
import 'package:pilot_project/data/repos/property_repo.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pilot_project/presentation/screens/admin/addedProperties.dart';
import 'package:pilot_project/presentation/screens/user/propertyDetail.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

// Import your PDF content widget
// make sure you import it

class PropertyController extends GetxController {
  RxList<PropertyModel> properties = <PropertyModel>[].obs;
  RxList<PropertyModel> filteredProperties =
      <PropertyModel>[].obs; // For filtered results
  RxList<PropertyModel> isFav = <PropertyModel>[].obs;

  RxList<String> types =
      ["Residential", "Commercial", "Holiday Homes"].obs; // Available types
  List<String> locations = [
    "Ahmedabad",
    "GIFT City",
    "Vadodara",
    "Surat",
    "Sanand",
    "Gandhinagar",
    "Mohali",
    "Dhulera",
    "Himachal"
  ]; // Available locations
  RxString selectedType = "".obs;
  RxString selectedLocation = "".obs;
  @override
  void onInit() {
    super.onInit();
    loadProperties();
    filteredProperties.value = properties; // Initialize filtered properties
  }

  void loadProperties() async {
    List<PropertyModel> response = await PropertyRepo().getProperties();
    properties.value = response; // Initialize filtered properties
  }

  // Filter by Type
  // Filter by Type
  void filterProperties({String? type, String? location}) {
    filteredProperties.value = properties.where((p) {
      final matchesType = type == null || type.isEmpty || p.type == type;
      final matchesLocation =
          location == null || location.isEmpty || p.address == location;

      return matchesType && matchesLocation;
    }).toList();
  }

  // Reset Filters
  void resetFilters() {
    selectedType.value = "";
    selectedLocation.value = "";
    filteredProperties.value = List.from(properties);
  }

  final RxList<String> selectedFilters = <String>[].obs;

  void addFilter(String filter) {
    if (!selectedFilters.contains(filter)) {
      selectedFilters.add(filter);
    }
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }

  Future<void> captureAndDownloadPageAsPdf(dynamic previewContainer) async {
    // Request permission
    var status = await Permission.storage.request();
    if (!status.isGranted) return;

    try {
      RenderRepaintBoundary boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final pdf = pw.Document();
      final imageProvider = pw.MemoryImage(pngBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
            child: pw.Image(imageProvider),
          ),
        ),
      );

      final output = await getExternalStorageDirectory();
      final file = File("${output!.path}/my_page_capture.pdf");
      await file.writeAsBytes(await pdf.save());

      print("PDF saved at ${file.path}");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<Uint8List> loadNetworkImage(String url) async {
    final response =
        await http.get(Uri.parse("${ApiRoutes.imageRoutes}${url}"));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<void> generateAndSavePdf(
      BuildContext context, PropertyModel property) async {
    final pdf = pw.Document();

    // Step 1: Load all images as Uint8List
    List<Uint8List> imageBytesList = [];

    for (String url in property.images) {
      try {
        final response =
            await http.get(Uri.parse("${ApiRoutes.imageRoutes}${url}"));
        if (response.statusCode == 200) {
          imageBytesList.add(response.bodyBytes);
        }
      } catch (e) {
        print("Failed to load image: $url");
      }
    }

    // Step 2: Build the PDF page
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          final titleColor = PdfColors.blue800;
          final labelStyle =
              pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);
          final valueStyle = pw.TextStyle(fontSize: 14);
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                if (imageBytesList.isNotEmpty)
                  pw.Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: imageBytesList.map((imgBytes) {
                      return pw.Container(
                        height: 150, // Adjust for grid size
                        width: (PdfPageFormat.a4.availableWidth - 30) /
                            2, // Two per row with spacing
                        decoration: pw.BoxDecoration(
                          image: pw.DecorationImage(
                            image: pw.MemoryImage(imgBytes),
                            fit: pw.BoxFit.cover,
                          ),
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                      );
                    }).toList(),
                  ),
                pw.SizedBox(height: 20),
                pw.Container(
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey200,
                    borderRadius: pw.BorderRadius.circular(6),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Property Brochure',
                        style: pw.TextStyle(
                          color: titleColor,
                          fontSize: 24,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Divider(thickness: 1, color: PdfColors.grey600),
                      pw.SizedBox(height: 12),

                      // Property Name
                      pw.Text('Property Name:', style: labelStyle),
                      pw.Text(property.projectName, style: valueStyle),
                      pw.SizedBox(height: 10),

                      // Location
                      pw.Text('Location:', style: labelStyle),
                      pw.Text(property.address, style: valueStyle),
                      pw.SizedBox(height: 10),

                      // Price
                      pw.Text('Price:', style: labelStyle),
                      pw.Text('${property.price}', style: valueStyle),
                      pw.SizedBox(height: 10),

                      // Description
                      pw.Text('Description:', style: labelStyle),
                      pw.Text(property.description, style: valueStyle),
                    ],
                  ),
                )
              ],
            )
          ];
        },
      ),
    );

    // Step 3: Save to file
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/property_details.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    // Step 4: Notify user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PDF saved to $filePath'),
        action: SnackBarAction(
          label: 'Open',
          onPressed: () {
            OpenFile.open(filePath);
          },
        ),
      ),
    );
  }

// Example usage in a button:
// ElevatedButton(
//   onPressed: () => generateAndSavePdf(context),
//   child: const Text('Download PDF'),
// )
}
