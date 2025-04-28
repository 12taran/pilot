// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final void Function(String?) onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool isPasswordField;
  final bool readOnly;
  final bool autofocus;
  final bool showTrailingWidget;
  final bool isLabelEnabled;
  final bool isRequired;
  final String? hintText;
  final String? defaultValue;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? trailing;
  final Widget? prefixIcon;
  final VoidCallback? trailingFunction;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final double borderRadius;
  final EdgeInsets contentPadding;
  final EdgeInsets? margin;
  final double? width;
  final TextAlign textAlign;
  final bool? enable;
  final bool overrideHintText;

  MyTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.onSaved,
    this.onTap,
    this.controller,
    this.hintText,
    this.defaultValue,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.trailing,
    this.trailingFunction,
    this.prefixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.borderColor,
    this.focusedBorderColor,
    this.borderWidth = 1,
    this.focusedBorderWidth = 2,
    this.borderRadius = 10,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    this.margin,
    this.width,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.textInputAction = TextInputAction.newline,
    this.textAlign = TextAlign.left,
    this.enable,
    this.readOnly = false,
    this.autofocus = false,
    this.isPasswordField = false,
    this.showTrailingWidget = true,
    this.isRequired = true,
    this.isLabelEnabled = true,
    this.overrideHintText = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _showPassword = false;

  @override
  void initState() {
    _showPassword = !widget.isPasswordField;
    super.initState();
  }

  void toggleShowPassword() {
    setState(() => _showPassword = !_showPassword);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 2,
      showCursor: true,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      enabled: widget.enable,
      readOnly: widget.readOnly,
      cursorColor:Colors.black,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator as String? Function(String?)?,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.isPasswordField ? !_showPassword : false,
      textAlign: widget.textAlign,
      style: widget.textStyle ??
          TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: Constants.fontSizeTinySmall,
          ),
      
      decoration: InputDecoration(
        labelStyle: GoogleFonts.aBeeZee(),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.overrideHintText
            ? widget.hintText
            : " ${widget.labelText}",
        hintStyle: widget.hintTextStyle ??
            TextStyle(fontSize: 15.sp, color: Theme.of(context).hintColor),
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
              color: widget.borderColor ?? Theme.of(context).hintColor,
              width: widget.borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
              color: widget.borderColor ?? Theme.of(context).hintColor,
              width: widget.borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
              color: widget.focusedBorderColor ??
                  Theme.of(context).colorScheme.primary,
              width: widget.focusedBorderWidth),
        ),
        errorStyle: const TextStyle(fontSize: 14),
        errorMaxLines: 3,
        floatingLabelBehavior: widget.isLabelEnabled
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never,
        label: widget.isLabelEnabled
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Text(
                    widget.labelText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      shadows: [
                        Shadow(
                          offset: const Offset(-1.5, -1.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        Shadow(
                          offset: const Offset(1.5, -1.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        Shadow(
                          offset: const Offset(1.5, 1.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        Shadow(
                          offset: const Offset(-1.5, 1.5),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  )),
                  if (widget.isRequired)
                    const Text(' *',
                        style: TextStyle(color: Colors.red, fontSize: 25)),
                ],
              )
            : null,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showTrailingWidget
            ? widget.trailing ??
                (widget.isPasswordField
                    ? IconButton(
                        splashRadius: 1,
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25,
                        ),
                        onPressed: toggleShowPassword,
                      )
                    : null)
            : null,
      ),
    );
  }
}
