import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/presentation/screens/email_password_sign_up.dart';

class PhoneSignUpScreen extends StatefulWidget {
  const PhoneSignUpScreen({super.key});

  @override
  PhoneSignUpScreenState createState() => PhoneSignUpScreenState();
}

class PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextField(
              labelText: "Mobile Number",
              onChanged: (v) {},
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              labelText: "OTP",
              onChanged: (v) {},
              controller: _otpController,
              trailing: IconButton(
                  icon: const Icon(Icons.verified), onPressed: () {}),
            ),
            MyTextField(
              labelText: "Set Password",
              onChanged: (v) {},
              controller: _passwordController,
            ),

            const SizedBox(height: 20),

            // Toggle for isAdmin
            Row(
              children: [
                const Text("Register as Admin"),
                const Spacer(),
                Switch(
                  value: isAdmin,
                  onChanged: (value) {
                    setState(() {
                      isAdmin = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),
            CustomButtons(text: "Sign Up", onPressed: () {}),

            TextButton(
                onPressed: () {
                  Get.to(const EmailSignUpScreen());
                },
                child: const Text(
                  'Use Email Instead',
                  style: TextStyle(decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }
}
