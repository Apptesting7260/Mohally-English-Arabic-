// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';

import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsController extends GetxController {
  final _api = AuthRepository();
  final emailController = TextEditingController().obs;
  final namecontroller = TextEditingController().obs;
  final messagecontroller = TextEditingController().obs;
  RxBool loading = false.obs;
  void clearfield() {
    emailController.value.clear();
    namecontroller.value.clear();
    messagecontroller.value.clear();
  }

  void ContactUs_ApiHit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    if (context == null) {
      print("Error: Context is null!");
      return;
    }
    loading.value = true;
    Map data = {
      'name': namecontroller.value.text,
      'email': emailController.value.text,
      'message': messagecontroller.value.text,
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.contactusApi(data, header).then((value) {
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);

      loading.value = false;
      // loginbuttonused.value = false;
      print(value.message);
      if (value.message == "Your request was successfully submitted") {
        Utils.snackBar(context, 'Submit', value.message.toString());
        clearfield();
// Get.offAll(() => TabScreen(index: 0));
      } else {
        Utils.snackBar(context, 'Login', value.message.toString());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error);
      // Utils.snackBar(context, 'Failed', 'please check email/password');
      // loginbuttonused.value = false;
      // error.toString()
    });
  }
}
