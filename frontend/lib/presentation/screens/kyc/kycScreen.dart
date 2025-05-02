import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/controllers/kycController.dart';
import 'package:pilot_project/presentation/utils_widget.dart';
import 'package:pilot_project/routes/page_route.dart';

class KycScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        
          children: [
            SizedBox(height:Get.height*0.05),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.green)),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Let us know you!',
              style: TextStyle(fontSize:Constants.fontSizeExtraLarge, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 8),
            Text(
              'Have these documents ready for a quick\n2-minute verification',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600],fontSize: Constants.fontSizeSmall),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/pan.png', height: 150),
            Text('Pan Card',style: TextStyle(fontSize: Constants.fontSizeSmall,fontWeight: FontWeight.w500),),
            SizedBox(height: 20),
            Image.asset('assets/images/aadhar.png', height: 150),
            Text('Aadhar Card',style: TextStyle(fontSize: Constants.fontSizeSmall,fontWeight: FontWeight.w500),),
            SizedBox(height: Get.height*0.1,),
            CustomButtons(
              onPressed: () {print('okkk');
                Get.toNamed(PageRoutes.panVerifyScreen);},
              text:   "Let's do it",
              ),
            
            
          ],
        ),
      ),
    );
  }
}


class PanVerificationScreen extends StatelessWidget {
  final KycController kycController = Get.put(KycController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        
          children: [
            SizedBox(height:Get.height*0.07),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  
                  },
                 icon: Icon(Icons.arrow_back, color: Colors.green)),
                Spacer(),
              
              ],
            ),
             SizedBox(height: Get.height * 0.05),
            Text(
              'Hello! Verify Your PAN for Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Constants.fontSizeHeading,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Text(
              'Enter your PAN number and pave the way\nfor your investment future.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/pan.png', height: 150),
            SizedBox(height: Get.height * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Enter PAN Number',
                  style: TextStyle(fontSize: Constants.fontSizeSmall,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MyTextField(
                isLabelEnabled: false,
                controller: kycController.panController,
                labelText: 'PAN Number',
                onChanged: (value){},
              ),
            ),
            SizedBox(height: 30),
           CustomButtons(text: 'Continue', onPressed:(){
              //kycController.validatePan();
              if (kycController.aadharError.value == null) {
                Get.toNamed(PageRoutes.aadharVerifyScreen);
              } else {
               Utils.showToast(message:kycController.panError.value!);
              }
          //  Get.toNamed();
           })
          ],
        ),
      ),
    );
  }
}

class AadharVerificationScreen extends StatelessWidget {
  final KycController kycController = Get.put(KycController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.07),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.green),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: Get.height * 0.05),
            Text(
              'Hello! Verify Your Aadhar for Success',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Constants.fontSizeHeading,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Text(
              'Enter your Aadhar number and pave the way\nfor your investment future.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/aadhar.png', height: 150),
            SizedBox(height: Get.height * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Enter Aadhar Number',
                  style: TextStyle(
                    fontSize: Constants.fontSizeSmall,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: MyTextField(
                isLabelEnabled: false,
                controller: kycController.aadharController,
                labelText: 'Aadhar Number',
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 30),
            CustomButtons(
              text: 'Continue',
              onPressed: () {
                kycController.validateAadhar();
                if (kycController.aadharError.value == null) {
                  // Navigate to the next screen
                  // Get.toNamed(PageRoutes.nextScreen);
                } else {
                  Utils.showToast(message: kycController.aadharError.value!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}