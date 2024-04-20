// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user_verify_model/user_verify_model.dart';

String? varificationemail;

class Verifyemail_controller extends GetxController {
  final _api = AuthRepository();
  var userList = UserVerifyModel().obs;
  RxString error = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserVerifyModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void Verifyeusermail_apihit(String email) async {
    setRxRequestStatus(Status.COMPLETED);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    print("otp send1");
    print(email);

    loading.value = false;
    Map data = {'email': email, 'type': "email", 'language_type': lang};

    await _api.Verifyemailapi(data).then((value) {
      statusOfApi.value = value.status.toString();
      setUserList(value);
      loading.value = true;

      print("$data===========================otpdata");
      print("otp send2");
      // Get.to(VerificationCodeScreen(
      //   emailText: email,
      //   controller: TextEditingController(),
      //   pinPutFocusNode: FocusNode(),
      // ));

      varificationemail = email;
    }).onError((error, stackTrace) {
      loading.value = false;
      print("$error==========Error of verifymail");
      // Utils2.snackBar('incorrect', error.toString());
      return;
    });
  }
}
