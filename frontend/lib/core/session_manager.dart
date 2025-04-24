import 'dart:convert';

import 'package:pilot_project/core/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SharedPreferences? sharedPreferences;

  SessionManager();

  // save hsn data

  // get token from shared preference
  Future<String?> getToken() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    return sharedPreferences?.getString(Constants.TOKEN);
  }

  // get

  Future<String?> getFirebaseToken() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    return sharedPreferences?.getString(Constants.FIREBASE_TOKEN);
  }
  Future<void >setUserId(String userId) async{
    sharedPreferences ??= await SharedPreferences.getInstance();
    sharedPreferences?.setString(Constants.USER_ID, userId);
  }
}
