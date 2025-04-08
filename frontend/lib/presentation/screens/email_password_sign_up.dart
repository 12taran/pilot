import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/presentation/screens/phone_sign_up.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  EmailSignUpScreenState createState() => EmailSignUpScreenState();
}

class EmailSignUpScreenState extends State<EmailSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextField(
                labelText: "Email",
                onChanged: (v) {},
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                labelText: "Password",
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
                    Get.to(const PhoneSignUpScreen());
                  },
                  child: const Text(
                    'Use Phone Number Instead',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
