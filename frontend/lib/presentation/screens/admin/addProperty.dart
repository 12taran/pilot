import 'package:flutter/material.dart';
import 'package:pilot_project/core/components/MyTextField.dart';

class Addproperty extends StatefulWidget {
  const Addproperty({super.key});

  @override
  State<Addproperty> createState() => _AddpropertyState();
}

class _AddpropertyState extends State<Addproperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Property"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 56, 98, 57),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Add your form fields here
            // For example:
            MyTextField(
              onChanged: (value) => {},
            labelText: 'Property Name',
            ),
            SizedBox(height: 20,),
            MyTextField(
              onChanged: (value) => {},
            labelText: 'Property Location',
            ),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
