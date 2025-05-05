import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pilot_project/core/config.dart';

class UtilsWidget {
  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // get loading dialog
  static getLoadingDialog() {
    return Container(
      color: Colors.transparent,
      height: Get.height * 0.6,
      width: Get.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static Future showWebXBottomSheet(
    BuildContext context,
    Widget child,
  ) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.8,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 0,
                left: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  mini: true,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Icon(Icons.close,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 4,
                      right: 4,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  margin: const EdgeInsets.only(top: 70),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [child],
                  ))),
            ],
          ),
        );
      },
    );
  }

  static Future showWebXBottomSheetWithOutScroll(
      BuildContext context, Widget child,
      {double? height}) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: height ?? Get.height * 0.9,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 0,
                left: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  mini: true,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Icon(Icons.close,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  padding: EdgeInsets.only(
                      top: 5,
                      left: 4,
                      right: 4,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  margin: const EdgeInsets.only(top: 70),
                  child: child),
            ],
          ),
        );
      },
    );
  }

  static Future showWebXDialog(
    BuildContext context,
    Widget child,
  ) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Theme.of(context).colorScheme.background,
                        ),
                        padding:
                            const EdgeInsets.only(top: 0, left: 4, right: 4),
                        margin: const EdgeInsets.only(top: 70),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [child],
                        ))),
                  ),
                ],
              )
            ],
          );
        });
  }

  static Future showWebDialog({
    required BuildContext context,
    required Widget child,
    Widget? titleChild,
    String title = "",
    double? width,
    double? height,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return SizedBox(
          width: width ?? Get.width * 0.4,
          height: height ?? Get.height * 0.4,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            surfaceTintColor: Theme.of(context).colorScheme.onSecondary,
            shadowColor: Theme.of(context).colorScheme.onSecondary,
            title: Row(
              children: [
                title.isEmpty ? (titleChild ?? const SizedBox()) : Text(title),
                const Spacer(),
                Container(
                  width: 70,
                  constraints: const BoxConstraints(
                    maxHeight: 70,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    mini: true,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(Icons.close,
                        color: Theme.of(context).colorScheme.background),
                  ),
                )
              ],
            ),
            content: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                width: width ?? Get.width * 0.45,
                height: height ?? Get.height * 0.45,
                padding: EdgeInsets.only(
                    top: 5,
                    left: 4,
                    right: 4,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                margin: const EdgeInsets.only(top: 10),
                child: child),
          ),
        );
      },
    );
  }

  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget child,
    Widget? titleChild,
    String title = "",
    double? width,
    double? height,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return SizedBox(
          width: width ?? MediaQuery.of(context).size.width * 0.4,
          height: height ?? MediaQuery.of(context).size.height * 0.4,
          child: AlertDialog(
            backgroundColor: Colors.white, // Adjust as needed
            surfaceTintColor: Colors.white, // Adjust as needed
            shadowColor: Colors.white,
            // Adjust as needed
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title.isEmpty
                    ? (titleChild ?? const SizedBox())
                    : Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            content: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              width: width ?? MediaQuery.of(context).size.width * 0.45,
              height: height ?? MediaQuery.of(context).size.height * 0.45,
              padding: EdgeInsets.only(
                top: 5,
                left: 4,
                right: 4,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              margin: const EdgeInsets.only(top: 10),
              child: child,
            ),
          ),
        );
      },
    );
  }

  // show confirmation dialog
  static Future showConfirmationDialog(
      {required Function() onYesPressed,
      required Function() onNoPressed,
      required BuildContext context,
      String? message}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text("Confirmation",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            content: Text(
              message!,
              style: TextStyle(fontSize: Constants.fontSizeSmall + 2),
            ),
            actions: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.withOpacity(0.1),
                ),
                child: TextButton(
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    onNoPressed();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.withOpacity(0.1),
                ),
                child: TextButton(
                  child: Text(
                    "YES",
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    onYesPressed();
                  },
                ),
              ),
            ],
          );
        });
  }

  // showDialogPage
  static Future showDialogPage(
      {required BuildContext context,
      required Widget child,
      String? title,
      double? width,
      double? height}) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: title != null ? Text(title) : null,
          content: SizedBox(
            width: width ?? Get.width * 0.45,
            height: height ?? Get.height * 0.95,
            child: child,
          ),
        );
      },
    );
  }

  // no active plans

  // webx date dialog
  static Future<DateTime?> showWebXDatePicker(
    DateTime initialDate,
  ) async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 30)),
      lastDate: DateTime.now().add(const Duration(days: 10)),
    );
  }
}
