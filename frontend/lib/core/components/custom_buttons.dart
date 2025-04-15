import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';

class CustomButtons extends StatelessWidget {
  CustomButtons({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.margin = const EdgeInsets.all(10),
    this.textColor,
    this.elevation = 1,
    this.fontSize = 12,
    this.height,
    this.width,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final EdgeInsets margin;
  final double? elevation;
  final double? fontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomContainer(
      elevation: elevation ?? 0,
      width: width,
      height: height,
      backgroundColor: color ?? theme.colorScheme.primary,
      margin: margin,
      onTap: onPressed,
      borderRadius: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text.toUpperCase(),
            style: GoogleFonts.acme(
              color: textColor ?? theme.colorScheme.onPrimary,
              fontSize: fontSize ?? Constants.fontSizeSmall,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
