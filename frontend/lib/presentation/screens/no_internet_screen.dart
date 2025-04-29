//import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/logo.png',
                height: Get.height * 0.1,
                width: Get.width * 0.8,
              ),
              SizedBox(
                height: Get.height * 0.18,
              ),
              Icon(
                Icons.signal_wifi_off,
                size: Get.height * 0.1,
                color: Colors.red,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Text(
                'No Internet Connection',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),
            ],
          ),
        ));
  }
}
