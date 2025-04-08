import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/core/config.dart';

class UtilsWidget {
  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            color: Constants.primaryColor,
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
          Center(
              child: CircularProgressIndicator(
            color: Constants.primaryColor,
          )),
        ],
      ),
    );
  }

  static getEmptyWidgetHorizontal() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/png/empty.png",
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "no_data_found".tr,
            style: const TextStyle(
              fontSize: Constants.fontSizeSmall,
              fontWeight: FontWeight.normal,
              color: Constants.borderColor,
            ),
          ),
        ],
      ),
    );
  }

  // get empty widget
  static getEmptyWidget({String? message}) {
    return Container(
      color: Colors.transparent,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/png/empty.png",
            height: 100,
            width: 100,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(
            message ?? "no_data_found".tr,
            style: const TextStyle(
                color: Constants.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
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
                  backgroundColor: Constants.black,
                  child:
                      const Icon(Icons.close, color: Constants.backgroundColor),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    color: Constants.backgroundColor,
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
                  backgroundColor: Constants.black,
                  child:
                      const Icon(Icons.close, color: Constants.backgroundColor),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    color: Constants.backgroundColor,
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
                  Positioned(
                    top: 10,
                    right: 0,
                    left: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      mini: true,
                      backgroundColor: Constants.black,
                      child: const Icon(Icons.close,
                          color: Constants.backgroundColor),
                    ),
                  ),
                  Center(
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Constants.backgroundColor,
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
            backgroundColor: Constants.white,
            surfaceTintColor: Constants.white,
            shadowColor: Constants.white,
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
                    backgroundColor: Constants.black,
                    child: const Icon(Icons.close,
                        color: Constants.backgroundColor),
                  ),
                )
              ],
            ),
            content: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Constants.backgroundColor,
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
            backgroundColor: Constants.backgroundColor,
            title: Text("confirmation".tr),
            content: Text(message ?? "del_conf".tr),
            actions: <Widget>[
              TextButton(
                child: Text("no".tr),
                onPressed: () {
                  onNoPressed();
                },
              ),
              TextButton(
                child: Text("yes".tr),
                onPressed: () {
                  onYesPressed();
                },
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
          backgroundColor: Constants.transparent,
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

  static Widget getSplashBottom() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/secure.png",
                  width: 25,
                  height: 25,
                  color: Constants.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("100% SECURE",
                    style: GoogleFonts.montserrat(
                        color: Constants.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  "assets/png/easy.png",
                  width: 25,
                  height: 25,
                  color: Constants.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Easy to Use".toUpperCase(),
                    style: GoogleFonts.montserrat(
                        color: Constants.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Made with",
              style: GoogleFonts.montserrat(
                  color: Constants.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.favorite,
              color: Constants.errorColor,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "in India for a",
              style: GoogleFonts.montserrat(
                  color: Constants.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "आत्मनिर्भर भारत",
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                  color: Constants.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  static Widget getSplashBottomLight() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/png/secure.png",
                    width: 25,
                    height: 25,
                    color: Constants.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("100% SECURE",
                      style: GoogleFonts.montserrat(
                          color: Constants.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/png/easy.png",
                    width: 25,
                    height: 25,
                    color: Constants.primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Easy to Use".toUpperCase(),
                      style: GoogleFonts.montserrat(
                          color: Constants.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Made with",
                style: GoogleFonts.montserrat(
                    color: Constants.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.favorite,
                color: Constants.errorColor,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "in India for a",
                style: GoogleFonts.montserrat(
                    color: Constants.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "आत्मनिर्भर भारत",
                textAlign: TextAlign.right,
                style: GoogleFonts.montserrat(
                    color: Constants.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/png/make_in_india.png",
                width: 60,
                height: 60,
              ),
              Image.asset(
                "assets/png/start_up_india.png",
                width: 80,
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget getSplashBottomPrimary() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/secure.png",
                  width: 25,
                  height: 25,
                  color: Constants.primaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("100% SECURE",
                    style: GoogleFonts.montserrat(
                        color: Constants.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  "assets/png/easy.png",
                  width: 25,
                  height: 25,
                  color: Constants.primaryColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Easy to Use".toUpperCase(),
                    style: GoogleFonts.montserrat(
                        color: Constants.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Made with",
              style: GoogleFonts.montserrat(
                  color: Constants.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.favorite,
              color: Constants.errorColor,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "in India for a",
              style: GoogleFonts.montserrat(
                  color: Constants.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "आत्मनिर्भर भारत",
              textAlign: TextAlign.right,
              style: GoogleFonts.montserrat(
                  color: Constants.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/png/make_in_india.png",
              width: 60,
              height: 60,
            ),
            Image.asset(
              "assets/png/start_up_india.png",
              width: 80,
              height: 80,
            ),
          ],
        ),
      ],
    );
  }

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
