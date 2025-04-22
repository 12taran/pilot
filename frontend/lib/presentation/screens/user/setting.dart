import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Setting',
          style: GoogleFonts.acme(
              textStyle: Theme.of(context).appBarTheme.titleTextStyle),
        ),
      ),
      body:
      Center(
        child: Text(
          'Adjust your settings here',
          style: GoogleFonts.acme(fontSize: 24),)
    ));
  }
}
