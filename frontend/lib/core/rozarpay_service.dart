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
    // Call your backend to create order
    final response = await http.post(
      Uri.parse("https://your-backend-url.com/order"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"amount": amount}),
    );

    final data = jsonDecode(response.body)['data'];

    var options = {
      'key': 'your_razorpay_key', // only key, not secret
      'amount': data['amount'],
      'name': 'Share Sampatti',
      'order_id': data['id'], // razorpay order_id from backend
      'description': 'Payment for something',
      'prefill': {
        'contact': '9876543210',
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
      Uri.parse("https://your-backend-url.com/paymentVerify"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    final result = jsonDecode(verifyResponse.body);
    if (verifyResponse.statusCode == 200) {
      print("Payment Verified: ${result['message']}");
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
