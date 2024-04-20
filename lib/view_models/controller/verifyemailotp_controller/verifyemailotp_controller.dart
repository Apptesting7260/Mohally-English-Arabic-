import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repository/Auth_Repository/auth_repository.dart';

class VerifyEmailOTP_controller extends GetxController {
  final _api = AuthRepository();
  RxBool verified = false.obs;
  final pinController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  Future<void> VerifyEmailOTP_apihit(String email, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    // ignore: unnecessary_null_comparison
    if (context == null) {
      print("Error: Context is null!");
      return;
    }
    loading.value = true;
    Map data = {
      'email': email,
      'otp': pinController.value.text,
      'language_type': lang
    };
    await _api.Verifyemailapi(data).then((value) {
      statusOfApi.value = value.status.toString();
      // setUserList(value);
      loading.value = false;
      if (value.message == "Otp Verifed Successfully.") {
        Utils.snackBar(context, 'Success', value.message.toString());
        pinController.value.clear();
      } else {
        Utils.snackBar(context, 'Error', value.message.toString());
        pinController.value.clear();
      }
    }).onError((error, stackTrace) {
      print("Error: $error");
      loading.value = false;
      Utils.snackBar(context, 'Failed', 'Please check OTP');
    });
    // print(data);
    //  if (value.message == "Otp Verifed Successfully.") {
    //     Utils.snackBar(context, 'Success', value.message.toString());
  }
}
