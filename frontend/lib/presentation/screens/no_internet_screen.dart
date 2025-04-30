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
        appBar: AppBar(title:Center(child: Text('Share Sampatti')),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon(
                Icons.signal_wifi_off,
                size: Get.height * 0.05,
                color: Colors.red,
              ),
            
              const Text(
                'No Internet Connection',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              SizedBox(height: 20,),
              const Text(
                'Kindly turn on Mobile data or Wi-Fi to continue',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),

                            Image.asset(
                'assets/icon/logo.png',
                height: Get.height * 0.5,
                width: Get.width * 0.8,
              ),
           
            ],
          ),
        ));
  }
}
