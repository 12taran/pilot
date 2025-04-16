import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as Img;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
//import 'package:scan/scan.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sh_toast/show_toast.dart';

//import 'package:toastification/toastification.dart';

/// @author TARUN PAL
/// @email tarunplay3551@gmail.com
/// @DATE 17/11/22
class Utils {
  // show Toast
  static void showGetXToast({required String title, required String message}) {
    Fluttertoast.showToast(msg: title);
   
  }

  //
  // file to qr text
 

  Future<Img.Image?> resizeImg(String path, {int selectedPageSize = 0}) async {
    try {
      String imageUrl = path.replaceAll(' ', '%20');

      // ✅ 1. Check if image is cached
      String cachedFilePath = await _getCachedFilePath(imageUrl);
      if (File(cachedFilePath).existsSync()) {
        print("🟢 Using Cached Image: $cachedFilePath");
        Uint8List bytes = await File(cachedFilePath).readAsBytes();
        return Img.decodeImage(bytes);
      }

      // ✅ 2. Use `http.head()` to check image size before downloading
      http.Response headResponse = await http.head(Uri.parse(imageUrl));
      if (headResponse.headers.containsKey('content-length')) {
        int contentLength = int.parse(headResponse.headers['content-length']!);
        if (contentLength > 5000000) {
          // Skip downloading if >5MB
          print(
              "❌ Image too large (${(contentLength / 1000000).toStringAsFixed(2)} MB), skipping.");
          return null;
        }
      }

      // ✅ 3. Download Image
      http.Response response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode != 200) {
        print("❌ Failed to download image: ${response.statusCode}");
        return null;
      }

      Uint8List bytes = response.bodyBytes;
      final Img.Image? originalImage = Img.decodeImage(bytes);

      if (originalImage == null) return null;

      // ✅ 4. Resize only if larger than required
      int newWidth = selectedPageSize == 0 ? 150 : 180;
      int newHeight = selectedPageSize == 0 ? 150 : 180;

      if (originalImage.width <= newWidth &&
          originalImage.height <= newHeight) {
        print("✅ Image already small, no resize needed.");
        return originalImage;
      }

      final Img.Image resizedImage =
          Img.copyResize(originalImage, width: newWidth, height: newHeight);

      // ✅ 5. Cache the resized image
      await File(cachedFilePath).writeAsBytes(Img.encodePng(resizedImage));
      print("📌 Image cached at: $cachedFilePath");

      return resizedImage;
    } catch (e) {
      print("❌ Error resizing image: $e");
      return null;
    }
  }

  Future<String> _getCachedFilePath(String url) async {
    Directory cacheDir = await getTemporaryDirectory();
    String fileName = Uri.parse(url).pathSegments.last;
    return "${cacheDir.path}/$fileName";
  }

  // get upi://pay?pa=khans01@paytm&pn=PaytmUser&mc=0000&mode=02&purpose=00&orgid=159761&cust=1242348780
  // pa FROM QR CODE
  String? getUpiId(String qrString) {
    try {
      if (qrString.isEmpty) {
        return null;
      }
      if (!qrString.contains("upi://")) {
        return null;
      }
      // convert upi url to uri
      Uri uri = Uri.parse(qrString);
      // get pa from uri
      String? paId = uri.queryParameters['pa'];
      return paId;
    } catch (e) {
      return qrString;
    }
  }

  // create upi url
  String createUpiUrl({
    required String pa,
    required String pn,
    String am = "",
  }) {
    String upiUrl = "upi://pay?pa=$pa&pn=$pn&am=$am";
    return upiUrl;
  }

  static void showToast({required String message}) {
    //Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      webPosition: "center",
      gravity: ToastGravity.TOP,
      webBgColor: "linear-gradient(to right, #0E7CF4, #04419E)",
    );
  }

  // Store Setting Data Save

  // load Store Setting Data

  // get random color
  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // staff permission feature

  // staff permission feature

  // show loading

  // hide loading
  static void hideLoading() {
    Get.back();
  }

  static String convertToPercentage(
      {required String discount, required String price}) {
    // discount is in value
    // price is in value
    double discountValue = double.tryParse(discount) ?? 0;
    double priceValue = double.tryParse(price) ?? 0;
    double percentage = (discountValue / priceValue) * 100;
    return percentage.toStringAsFixed(2);
  }

  static String convertToAmount(
      {required String discountPercentage, required String price}) {
    // discount is in percentage
    // price is in value
    double discountPercentageValue = double.tryParse(discountPercentage) ?? 0;
    double priceValue = double.tryParse(price) ?? 0;
    double amount = (discountPercentageValue / 100) * priceValue;
    // amount = priceValue - amount;
    return amount.toStringAsFixed(2);
  }

  // calculate discount price
  static double calculateDiscountPrice(
      {required String price,
      required String discount,
      required String discountType}) {
    double priceValue = double.tryParse(price) ?? 0;
    double discountValue = double.tryParse(discount) ?? 0;
    double discountPrice = priceValue;
    if (discountType == "percentage") {
      discountPrice = ((discountValue / 100) * priceValue);
    } else {
      discountPrice = (discountValue);
    }
    return discountPrice;
  }

  static calculateTotalPrice(
      {required String price,
      required String discount,
      required String discountType,
      required int quantity}) {
    double priceValue = double.tryParse(price) ?? 0;
    double discountValue = double.tryParse(discount) ?? 0;
    double totalPrice = priceValue;
    print("calculate total price");
    print(discountType);
    print(discountValue);
    print(priceValue);
    if (discountType == "percentage") {
      totalPrice =
          (priceValue - ((discountValue / 100) * priceValue)) * quantity;
    } else {
      totalPrice = (priceValue - (discountValue)) * quantity;
    }
    print("totalPrice");
    print(totalPrice);
    return totalPrice.toStringAsFixed(2);
  }

 /* static Future<XFile> createFile(String s, Uint8List uint8list) async {
    Uint8List imageInUnit8List = uint8list;
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/$s.png').create();
    file.writeAsBytesSync(imageInUnit8List);
    return XFile(file.path);
  }

  // share files
  static Future<void> shareFile(File file, String subject, String text) async {
    final bytes = await file.readAsBytes();
    final directory = await getTemporaryDirectory();
    final pathOfImage =
        await File('${directory.path}/${file.path.split("/").last}').create();
    final image = await pathOfImage.writeAsBytes(bytes);
    // final status = await PermissionUtils.requestStoragePermission();
    if (true) {
      await Share.shareXFiles(
        [XFile(image.path)],
        subject: subject,
        text: text,
      );
    }
  }
*/
  // share files on whatsapp
}
