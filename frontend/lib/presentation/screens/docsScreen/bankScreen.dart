import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/MyTextField.dart';
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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.indigo),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Enter your bank details',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
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
              label("Select Account Type"),
              Row(
                children: [
                  accountTypeRadio("Savings"),
                  const SizedBox(width: 20),
                  accountTypeRadio("Current"),
                ],
              ),
              if (bankController.accountType.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '!! Please select an account type',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && bankController.accountType.isNotEmpty) {
                      // Add account logic here
                      Utils.showToast(message: "Account added successfully!");
                    } else if (bankController.accountType.isEmpty) {
                      Utils.showToast(message: "Please fill required details");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.orange, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  ),
                  child: const Text("Add Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget label(String text) => Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );

  Widget accountTypeRadio(String type) => Row(
        children: [
          Radio<String>(
            value: type,
            groupValue: bankController.accountType.value,
            onChanged: (value) {
             bankController.accountType.value = value!;
            },
            activeColor: Colors.indigo,
          ),
          Text(type, style: const TextStyle(fontSize: 16)),
        ],
      );
}