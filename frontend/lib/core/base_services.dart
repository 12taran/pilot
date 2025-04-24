// ignore_for_file: implementation_imports

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/src/response.dart' as dio_response;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pilot_project/core/config.dart';
import 'package:pilot_project/core/session_manager.dart';
import 'package:pilot_project/routes/api_routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

import "package:http_parser/http_parser.dart" show MediaType;

class BaseService extends GetxService {
  SharedPreferences? sharedPreferences;

  BaseService();

  // static Dio _dioGoogleAddress() {
  //   return Dio(
  //     BaseOptions(
  //       baseUrl: ApiRoutes.googleBaseUrl,
  //       headers: {Headers.acceptHeader: Headers.jsonContentType},
  //     ),
  //   )..interceptors.addAll([
  //       PrettyDioLogger(
  //           requestBody: true, requestHeader: true, responseBody: true)
  //     ]);

  // static Future<MapAddress> getPlaceDetails(
  //     String? placeId, String googleMap) async {
  //   try {
  //     final res = await _dioGoogleAddress().get(ApiRoutes.googlePlaceDetails,
  //         queryParameters: {"place_id": placeId, "key": googleMap});
  //     print(res.data);
  //     return MapAddress.fromJson(res.data);
  //   } on DioError catch (e) {
  //     return MapAddress.fromJson(e.response!.data);
  //     //return empty list (you can also return custom error to be handled by Future Builder)
  //   }
  // }

  // static Future<AddressPredictions?> nearbyPlaces(
  //     {LatLng? latLng,
  //     String? input,
  //     String? rankBy,
  //     bool? strictBound,
  //     int? offSet,
  //     int? radiusMeter,
  //     String? googleMapKey}) async {
  //   Map<String, dynamic> queryParameters = {};
  //   queryParameters['input'] = input;
  //   if (latLng != null) {
  //     queryParameters['location'] = "${latLng.latitude},${latLng.longitude}";
  //     queryParameters['origin'] = "${latLng.latitude},${latLng.longitude}";
  //   }
  //   if (rankBy != null) {
  //     queryParameters['rankby'] = rankBy;
  //   }
  //   if (radiusMeter != null) {
  //     queryParameters['radius'] = radiusMeter;
  //   }
  //   if (offSet != null) {
  //     queryParameters['offset'] = offSet;
  //   }
  //   if (strictBound != null) {
  //     queryParameters['strictbounds'] = strictBound;
  //   }
  //   queryParameters['key'] = googleMapKey;

  //   try {
  //     final res = await _dioGoogleAddress()
  //         .get(ApiRoutes.googlePlaceUrl, queryParameters: queryParameters);
  //     print(res.data);
  //     return AddressPredictions.fromJson(res.data);
  //   } on DioError {
  //     return null;
  //     //return empty list (you can also return custom error to be handled by Future Builder)
  //   }
  // }

  // static Future<MapAddress> getAddress(
  //     LatLng latLng, String googleMapKey) async {
  //   try {
  //     String path =
  //         "${ApiRoutes.googleAddressUrl}?latlng=${latLng.latitude},${latLng.longitude}&key=$googleMapKey";
  //     final res = await _dioGoogleAddress().get(path);
  //     print(res.data);
  //     return MapAddress.fromJson(res.data);
  //   } on DioError catch (e) {
  //     return MapAddress.fromJson(e.response!.data);
  //     //return empty list (you can also return custom error to be handled by Future Builder)
  //   }
  // }

  Future<dio_response.Response> getData({
    String endPoint = '',
    Map<String, dynamic>? queryBody,
    bool isTokenRequired = false,
  }) async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    try {
      Dio dio = _dio();
      if (isTokenRequired) {
        dio.options.headers['Authorization'] =
            'Bearer ${await SessionManager().getToken()}';
      }
      return await dio.get(
        ApiRoutes().baseUrl + endPoint,
        queryParameters: queryBody,
      );
    } on DioError catch (e) {
      print("$endPoint $queryBody");
      return Future.error(e);
    }
  }

  // create a new method which can not wait for the response return response when it is ready
  void getDataWithOutWait({
    String endPoint = '',
    Map<String, dynamic>? queryBody,
    bool isTokenRequired = false,
    required Function(dynamic data) onDataReceived,
  }) {
    SharedPreferences.getInstance().then((value) async {
      sharedPreferences = value;
      try {
        Dio dio = _dio();
        if (isTokenRequired) {
          dio.options.headers['Authorization'] =
              'Bearer ${await SessionManager().getToken()}';
        }
        dio
            .get(
          ApiRoutes().baseUrl + endPoint,
          queryParameters: queryBody,
        )
            .then((value) {
          onDataReceived(value.data);
        }).catchError((e) {
          print("getDataWithOutWait ${ApiRoutes().baseUrl + endPoint}");
        });
      } on DioError catch (e) {
        print(endPoint);
        print(e);
        rethrow;
      }
    });
  }

  void getDataSync({
    String endPoint = '',
    Map<String, dynamic>? queryBody,
    bool isTokenRequired = false,
    required Function(dynamic data) onDataReceived,
  }) {
    SharedPreferences.getInstance().then((value) async {
      sharedPreferences = value;
      try {
        Dio dio = _dio();
        if (isTokenRequired) {
          dio.options.headers['Authorization'] =
              'Bearer ${await SessionManager().getToken()}';
        }
        dio
            .get(
          ApiRoutes().baseUrl + endPoint,
          queryParameters: queryBody,
        )
            .then((value) {
          onDataReceived(value.data);
        });
      } on DioError catch (e) {
        onDataReceived(e);
      }
    });
  }

  static Dio _dioMultiPart(String? accessToken) {
    Dio dio = Dio();
    dio.options.baseUrl = ApiRoutes().baseUrl;
    dio.options.headers = {
      'Authorization': 'Bearer $accessToken',
      Headers.acceptHeader: Headers.jsonContentType,
      'Content-Type': 'multipart/form-data',
    };
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true, requestHeader: true, responseBody: true));
    }
    return dio;
  }

  static Dio _dio() {
    Dio dio = Dio();
    dio.options.baseUrl = ApiRoutes().baseUrl;
    // increase connection timeout 50 sec
    dio.options.connectTimeout = const Duration(seconds: 50); // Duration object
    dio.options.receiveTimeout = const Duration(seconds: 50);
    dio.options.headers = {
      Headers.acceptHeader: Headers.jsonContentType,
      'Content-Type': 'application/json',
    };

    dio.options.headers['lng'] = Get.deviceLocale?.languageCode ?? 'en';
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true, requestHeader: true, responseBody: true));
    }

    return dio;
  }

  postMultiPartData({
    required String endPoint,
    required bool isTokenRequired,
    required Map<String, dynamic>? body,
    Map<String, File>? files,
  }) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      // create form data body
      dio.FormData formData = dio.FormData.fromMap(body!);
      // add files in form data
      files?.forEach((key, value) async {
        try {
          formData.files.add(MapEntry(
              key,
              await dio.MultipartFile.fromFile(
                value.path,
                filename: value.path.split("/").last,
              )));
        } catch (e) {
          log(e.toString());
        }
      });
      dio.Response response = await _dioMultiPart(token).post(
        endPoint,
        data: formData,
      );
      return response;
    } on DioError catch (e) {
      // throw error
      return Future.error(e);
    }
  }

  putMultiPartData(
      {required String endPoint,
      required bool isTokenRequired,
      required Map<String, dynamic>? body,
      required Map<String, File>? files}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      // create form data body
      dio.FormData formData = dio.FormData.fromMap(body!);
      // add files in form data
      files?.forEach((key, value) async {
        try {
          formData.files.add(MapEntry(
              key,
              await dio.MultipartFile.fromFile(
                value.path,
                filename: value.path.split("/").last,
              )));
        } catch (e) {
          log(e.toString());
        }
        //Harsh Bandral
      });
      dio.Response response = await _dioMultiPart(token).put(
        endPoint,
        data: formData,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  putMultiPartData2(
      {required String endPoint,
      required bool isTokenRequired,
      required Map<String, dynamic>? body,
      Map<String, Uint8List>? files}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      // create form data body
      dio.FormData formData = dio.FormData.fromMap(body!);
      // add files in form data
      files?.forEach((key, value) async {
        try {
          formData.files.add(MapEntry(
            key,
            dio.MultipartFile.fromBytes(
              value,
              filename: key, // You might want to generate a proper filename
            ),
          ));
        } catch (e) {
          log(e.toString());
        }
      });
      dio.Response response = await _dioMultiPart(token).put(
        endPoint,
        data: formData,
      );

      print("response: $response");
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  postMultiPartData2(
      {required String endPoint,
      required bool isTokenRequired,
      required Map<String, dynamic>? body,
      Map<String, File>? files}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      // FormData body;
      // final bytes = await image.readAsBytes();
      // final MultipartFile file = MultipartFile.fromBytes(bytes, filename: "picture");
      // MapEntry<String, MultipartFile> imageEntry = MapEntry("image", file);
      // body.files.add(imageEntry);
      // create form data body
      dio.FormData formData = dio.FormData.fromMap(body!);
      // add files in form data
      files?.forEach((key, value) async {
        try {
          print("forEach");
          print(value.path);
          print(key);
          final dio.MultipartFile file = dio.MultipartFile.fromString(
              value.path,
              filename: key,
              contentType: MediaType("image", "png"));
          MapEntry<String, dio.MultipartFile> imageEntry = MapEntry(key, file);
          formData.files.add(imageEntry);
        } catch (e) {
          log("forEach$e");
        }
      });
      dio.Response response = await _dioMultiPart(token).post(
        endPoint,
        data: formData,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  postMultiPartDataBytes(
      {required String endPoint,
      required bool isTokenRequired,
      required Map<String, dynamic>? body,
      Map<String, Uint8List>? files}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      // create form data body
      dio.FormData formData = dio.FormData.fromMap(body!);
      // add files in form data
      files?.forEach((key, value) async {
        try {
          formData.files.add(MapEntry(
            key,
            dio.MultipartFile.fromBytes(
              value,
              filename: key, // You might want to generate a proper filename
            ),
          ));
        } catch (e) {
          log(e.toString());
        }
      });
      dio.Response response = await _dioMultiPart(token).post(
        endPoint,
        data: formData,
      );

      print("response: $response");
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  postData(
      {required String endPoint,
      required Map<String, dynamic> body,
      required bool isTokenRequired}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      Dio dio = _dio();
      if (isTokenRequired) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
      return await dio.post(
        ApiRoutes().baseUrl + endPoint,
        data: body,
      );
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  deleteData(
      {required String endPoint,
      Map<String, dynamic>? body,
      required bool isTokenRequired}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      Dio dio = _dio();
      if (isTokenRequired) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
      return await dio.delete(
        ApiRoutes().baseUrl + endPoint,
        data: body,
      );
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  putData(
      {required String endPoint,
      required Map<String, dynamic> body,
      required bool isTokenRequired}) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      Dio dio = _dio();
      if (isTokenRequired) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
      return await dio.put(
        ApiRoutes().baseUrl + endPoint,
        data: body,
      );
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  patchData({
    required String endPoint,
    required Map<String, dynamic> body,
    required bool isTokenRequired,
  }) async {
    try {
      sharedPreferences ??= await SharedPreferences.getInstance();
      String token = sharedPreferences!.getString(Constants.TOKEN) ?? '';
      Dio dio = _dio();
      if (isTokenRequired) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }
      return await dio.patch(
        ApiRoutes().baseUrl + endPoint,
        data: body,
      );
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  // file downloader
  Future<dynamic> downloadFile(
      {required String endPoint, required bool isTokenRequired}) async {
    final String fileurl =
        ApiRoutes().baseUrl + endPoint; // Replace with your file URL
    try {
      print('download file');
      print(fileurl);
      // open url in browser
      if (await canLaunchUrl(Uri.parse(fileurl))) {
        await launchUrl(Uri.parse(fileurl));
      } else {
        throw 'Could not launch $fileurl';
      }
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
