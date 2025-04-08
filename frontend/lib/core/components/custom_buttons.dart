/// @author TARUN PAL
/// @email tarunplay3551@gmail.com
/// @DATE 06/11/22

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';


class CustomButtons extends StatelessWidget {
  const CustomButtons(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = Constants.primaryColor,
      this.margin = const EdgeInsets.all(10),
      this.textColor = Constants.white,
      this.elevation = 1,
      this.fontSize = 12,
      this.height,
      this.width})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final EdgeInsets margin;
  final double? elevation;

  // text size
  final double? fontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      elevation: elevation ?? 0,
      width: width ,
      height: height,
      backgroundColor: color,
      margin: margin,
      onTap: onPressed,
      borderRadius: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text.toUpperCase(),
              style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: fontSize??Constants.fontSizeSmall,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
