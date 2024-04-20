import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mohally/data/network/base_api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(
    String url,
  ) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      print("token----------${sp.getString("token").toString()}");
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': "Bearer ${sp.getString("token").toString()}"
      });
      print(response.body);
      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      print("token----------${sp.getString("token").toString()}");

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': "Bearer ${sp.getString("token").toString()}"
        },
      );

      print(response.body);
      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url,
      [Map<String, String>? header]) async {
    final sp = await SharedPreferences.getInstance();
//String token = sp.getString('token').toString();
    if (kDebugMode) {
      print("=========URL========$url");
      print("=========DATA=======$data");
    }

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data, headers: {
        'Authorization': "Bearer ${sp.getString('token').toString()}"
      }).timeout(const Duration(seconds: 30));
      print(sp.getString('token').toString());
      print(
          "========================response========body===========================");
      print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }
}
