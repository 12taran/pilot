import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/utils_widget.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RazorpayService {
  late Razorpay _razorpay;

  void init() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay.clear();
  }

  Future<void> openCheckout(int amount) async {
    print("Amount $amount");
    // Call your backend to create order
    print("${ApiRoutes().paymentRoute}order");
    final response = await http.post(
      Uri.parse("${ApiRoutes().paymentRoute}order"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"amount": amount}),
    );
    print('Response: ${response.body}');
    final data = jsonDecode(response.body)['data'];
 
    var options = {
      'key': 'rzp_test_lSlqZQTgc9E6dg', // only key, not secret
      'amount': data['amount'],
      'name': 'Share Sampatti',
      'order_id': data['id'], // razorpay order_id from backend
      'description': 'Payment for Property',
      'prefill': {
        'contact': '8006644674',
        'email': 'test@example.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final body = {
      "razorpay_order_id": response.orderId,
      "razorpay_payment_id": response.paymentId,
      "razorpay_signature": response.signature,
    };

    final verifyResponse = await http.post(
      Uri.parse("${ApiRoutes().paymentRoute}verify"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    final result = jsonDecode(verifyResponse.body);
    if (verifyResponse.statusCode == 200) {
      print(result);
      print("Payment Verified: ${result['message']}");

      UtilsWidget.showWebXDialog(
        Get.context!,
        CustomContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center align content
            children: [
              Icon(
                Icons.check_circle_outline, // A more modern check icon
                color: Colors.green[400], // A slightly softer green
                size: 72, // Slightly larger icon
              ),
              SizedBox(height: 20),
              Text(
                "Payment Successful!", // Hindi translation for "Payment Successful!"
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[
                        800]), // Slightly larger and bolder text with a darker color
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                "Thank you for your payment! Your Property Document will be delivered to your WhatsApp or Email soon!", // Hindi translation
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity, // Make button take full width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green[400], // Consistent green color
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8)), // Rounded button
                    elevation: 2, // Subtle button shadow
                  ),
                  onPressed: () {
                    Navigator.pop(Get.context!); // close dialog
                  },
                  child: Text(
                    "OK", // Hindi translation for "OK"
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      // Show success dialog
    } else {
      print("Verification Failed: ${result['message']}");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet selected: ${response.walletName}");
  }
}
