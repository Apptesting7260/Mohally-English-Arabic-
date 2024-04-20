import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/MyAccount/arabic_myaccount.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

var response;

class arabic_UpdateProfile_Controller extends GetxController {
  // ignore: unused_field
  final _api = AuthRepository();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  File? imgFile;

  MyAccountController MyAccountControllerin = MyAccountController();
  Future<void> arabicProfileApiHit() async {
    final sp = await SharedPreferences.getInstance();

    try {
      loading.value = true; // Set loading to true before making the API call

      var url =
          Uri.parse('https://urlsdemo.net/mohally/api/user-profile-update-api');
      var request = http.MultipartRequest('POST', url);
      if (imgFile != null) {
        // Check if imgFile is not null
        print("===imggg${imgFile}");
        var fileStream = http.ByteStream(imgFile!.openRead());
        var length = await imgFile!.length();
        var multipartFile = http.MultipartFile(
            'new_pro_img', fileStream, length,
            filename: imgFile!.path.split('/').last);
        request.files.add(multipartFile);
        print("==mul${multipartFile.filename}");
      }

      // Add other text fields to the request
      request.fields['first_name'] = firstNameController.value.text;
      request.fields['last_name'] = lastNameController.value.text;
      request.fields['phone'] = phoneController.value.text;
      // request.fields['new_pro_img'] = imgFile.toString();
      request.headers['Authorization'] = "Bearer ${sp.getString("token")}";

      // Send the request and get the response
      final streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse);
      var responseBody = response.body;

      print(responseBody);
      // Check the response status
      if (response.statusCode == 200) {
        // Get.back();
        Get.off(MyAccountScreen_arabic());

        Utils2.snackBar('Success', 'Edit Successfully');
      } else {
        Utils2.snackBar('Failed', '');
      }
    } catch (e) {
      print(e);
      Utils2.snackBar('Failed', '$e');
    } finally {
      loading.value =
          false; // Set loading back to false after handling the response
    }
  }
}
