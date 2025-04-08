// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/components/CustomContainer.dart';
import 'package:pilot_project/core/config.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final void Function(String?) onChanged;
  final void Function(String?)? onSaved;
  final VoidCallback? trailingFunction;
  final String? defaultValue;
  final bool showTrailingWidget;
  final Widget? trailing;
  final bool autofocus;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final double borderRadius;
  final String? hintText;
  final bool overrideHintText;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets contentPadding;
  final Widget? prefixIcon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isRequired;
  bool? isLabelEnabled;
  bool? enable;
  TextStyle? hintTextStyle;
  TextStyle? textStyle;
  List<TextInputFormatter>? inputFormatters;
  final maxLength;
  final minLines;
  final TextAlign textAlign;
  TextInputAction? textInputAction = TextInputAction.newline;

  MyTextField(
      {super.key,
      required this.labelText,
      required this.onChanged,
      this.onSaved,
      this.onTap,
      this.hintText,
      this.trailingFunction,
      this.defaultValue,
      this.keyboardType,
      this.controller,
      this.validator,
      this.trailing,
      this.enable,
      this.width,
      this.margin,
      this.maxLines = 1,
      this.minLines = 1,
      this.prefixIcon,
      this.isLabelEnabled = true,
      this.overrideHintText = false,
      this.showTrailingWidget = true,
      this.readOnly = false,
      this.autofocus = false,
      this.isPasswordField = false,
      this.borderColor = Constants.hintColor,
      this.focusedBorderColor = Constants.primaryColor,
      this.borderWidth = 1,
      this.maxLength = 100000000000,
      this.focusedBorderWidth = 2,
      this.borderRadius = 10,
      this.textAlign = TextAlign.left,
      this.contentPadding = const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      this.inputFormatters,
      this.textInputAction,
      this.isRequired = true,
      this.textStyle,
      this.hintTextStyle});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _showPassword;

  @override
  void initState() {
    _showPassword = !widget.isPasswordField;
    super.initState();
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: 10,
      elevation: 0,
      margin: widget.margin,
      child: TextFormField(
        enableIMEPersonalizedLearning: true,
        textInputAction: widget.textInputAction,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onSaved,
        onTapOutside: (value) {
          widget.onSaved != null
              ? (widget.onSaved!(widget.controller?.text))
              : null;
        },
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        enabled: widget.enable,
        minLines: widget.minLines,
        textAlign: widget.textAlign,
        controller: widget.controller,
        validator: widget.validator as String? Function(String?)?,
        initialValue: widget.defaultValue,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: widget.inputFormatters,
        buildCounter: (BuildContext context,
                {required int currentLength,
                required bool isFocused,
                required int? maxLength}) =>
            null,
        maxLength: widget.maxLength,
        autofocus: widget.autofocus,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        obscureText: widget.isPasswordField ? !_showPassword : false,
        maxLines: widget.maxLines,
        style: widget.textStyle ??
            const TextStyle(
                color: Constants.textColor,
                fontSize: Constants.fontSizeSubTitle),
        cursorColor: Constants.primaryColor,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: widget.isLabelEnabled!
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.never,
          hintText: 'Enter ${widget.labelText}',
          hintStyle: widget.hintTextStyle ??
              const TextStyle(fontSize: 12, color: Constants.hintColor),
          contentPadding: widget.contentPadding,
          errorStyle: const TextStyle(fontSize: 14),
          errorMaxLines: 3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? Theme.of(context).dividerColor,
              width: widget.borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Theme.of(context).primaryColor,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          label: widget.isLabelEnabled!
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        widget.labelText,
                        style: const TextStyle(
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.bold,
                            color: Constants.textColor,
                            inherit: true,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Constants.backgroundColor),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Constants.backgroundColor),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Constants.backgroundColor),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Constants.backgroundColor)
                            ]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.isRequired)
                      const Text(
                        ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                        ),
                      ),
                  ],
                )
              : Container(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  widget.focusedBorderColor ?? Theme.of(context).primaryColor,
              width: widget.focusedBorderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ).copyWith(
          hintText: widget.overrideHintText
              ? widget.hintText
              : " Enter ${widget.labelText}",
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.showTrailingWidget
              ? widget.trailing ??
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: widget.isPasswordField
                        ? IconButton(
                            splashRadius: 1,
                            icon: _showPassword
                                ? const Icon(Icons.visibility,
                                    color: Constants.primaryColor, size: 25.0)
                                : const Icon(Icons.visibility_off,
                                    color: Constants.primaryColor, size: 25.0),
                            onPressed: toggleShowPassword,
                          )
                        : null,
                  )
              : null,
        ),
      ),
    );
  }
}
