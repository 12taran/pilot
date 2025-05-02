import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
import 'package:pilot_project/core/components/custom_buttons.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/utils.dart';
import 'package:pilot_project/presentation/controllers/bankController.dart';

class BankDetailsScreen extends StatefulWidget {
  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  final BankController bankController = Get.put(BankController());
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Enter your bank details',
          style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                isLabelEnabled: false,
                labelText: 'Account Holder Name',
                hintText: 'Enter Account Holder Name',
                controller: bankController.accountHolderController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Account holder name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.05),
              MyTextField(
                    isLabelEnabled: false,
                labelText: 'Account Number',
                hintText: 'Enter Account Number',
                controller: bankController.accountNumberController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Account number is required';
                  }
                  if (value.length < 10) {
                    return 'Account number must be at least 10 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.05),
              MyTextField(
                    isLabelEnabled: false,
                labelText: 'Confirm Account Number',
                hintText: 'Confirm Account Number',
                controller: bankController.confirmAccountNumberController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your account number';
                  }
                  if (value != bankController.accountNumberController.text) {
                    return 'Account numbers do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.05),
              MyTextField(
                    isLabelEnabled: false,
                labelText: 'IFSC Code',
                hintText: 'HDFC0001223',
                controller: bankController.ifscController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'IFSC code is required';
                  }
                  if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
                    return 'Enter a valid IFSC code';
                  }
                  return null;
                },
              ),
              SizedBox(height: Get.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text( "Select Account Type",style: TextStyle(fontSize: Constants.fontSizeSmall+3, fontWeight: FontWeight.bold, )),
              ),
              Row(
                children: [
                  accountTypeRadio("Savings"),
                  const SizedBox(width: 20),
                  accountTypeRadio("Current"),
                ],
              ),
              Obx(() {
                return bankController.accountType.value.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '!! Please select an account type',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : const SizedBox.shrink(); // Return an empty widget if no error
              }),
              const SizedBox(height: 20),
              Center(
                child: CustomButtons(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && bankController.accountType.isNotEmpty) {
                      // Add account logic here
                      Utils.showToast(message: "Account added successfully!");
                    } else if (bankController.accountType.isEmpty) {
                      Utils.showToast(message: "Please fill required details");
                    }
                  },
                  
                  text:"Add Account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountTypeRadio(String type) => Row(
        children: [
          Obx(() => Radio<String>(
                value: type,
                groupValue: bankController.accountType.value,
                onChanged: (value) {
                  bankController.accountType.value = value!;
                },
                activeColor: Colors.indigo,
              )),
          Text(type, style: const TextStyle(fontSize: 16)),
        ],
      );
}