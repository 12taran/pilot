import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/routes/page_route.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  EmailSignUpScreenState createState() => EmailSignUpScreenState();
}

class EmailSignUpScreenState extends State<EmailSignUpScreen>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '',
                style: GoogleFonts.acme(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: Constants.fontSizeTinySmall * 1.5),
                  // color: Constants.textColor
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                'Sign Up to Continue!',
                style: GoogleFonts.acme(
                    fontSize: Constants.fontSizeHeading,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.labelMedium?.color),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              MyTextField(
                isLabelEnabled: false,
                //borderColor: Constants.primaryColor,
                focusedBorderColor: Colors.green.withBlue(200),
                labelText: "Email",
                onChanged: (v) {},
                controller: _emailController,
                validator: (v) => v!.isEmpty ? 'Email is required' : null,
              ),
              SizedBox(height: Get.height * 0.03),
              MyTextField(
                focusedBorderColor: Colors.green.withBlue(200),
                isLabelEnabled: false,
                // borderColor: Constants.primaryColor,
                labelText: "Password",
                onChanged: (v) {},
                controller: _passwordController,
                isPasswordField: true,
                validator: (v) => v!.isEmpty ? 'Password is required' : null,
              ),
              SizedBox(height: Get.height * 0.01),
              const SizedBox(height: 30),
              CustomButtons(
                color: Theme.of(context).colorScheme.primary,
                text: "Sign Up",
                textColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  Get.toNamed(PageRoutes.bottomNav);
                },
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(PageRoutes.phonesignup);
                    },
                    child: Text(
                      'Use Phone Number Instead',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.acme(
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                          decorationStyle: TextDecorationStyle.solid,
                          color: Theme.of(context).colorScheme.primary),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
