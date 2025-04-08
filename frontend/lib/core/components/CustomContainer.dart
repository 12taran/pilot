
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget child;
  final double padding;
  final EdgeInsets? paddingEdge;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color backgroundColor;
  final double borderRadius;
  final Color? shadowColor;
  final double elevation;
  final bool? disableOverLay;
  final double borderWidth;

  const CustomContainer({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.shadowColor,
    this.padding = 10,
    this.paddingEdge,
    this.borderRadius = 5,
    this.backgroundColor = Colors.white,
    this.disableOverLay = false,
    this.elevation = 2.5,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          key: key,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: borderWidth)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          color: backgroundColor,
          elevation: elevation,
          margin: margin,
          shadowColor: shadowColor,
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding:
                paddingEdge == null ? EdgeInsets.all(padding) : paddingEdge!,
            child: child,
          ),
        ),
      ),
    );
  }
}