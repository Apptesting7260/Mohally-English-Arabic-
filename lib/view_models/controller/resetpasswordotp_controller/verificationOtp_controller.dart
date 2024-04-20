import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/resetpasswordotp_model/resetpasswordotp_model.dart';
import 'package:mohally/presentation/create_password/create_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repository/Auth_Repository/auth_repository.dart';
import '../reset_password/reset_password_controller.dart';

class VerificationOTP_controller extends GetxController {
  final _api = AuthRepository();

  final pinController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  final otpModel = ResetpassOTPModel().obs;
  RxString error = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setAccountDetails(ResetpassOTPModel value) => otpModel.value = value;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;
  Future<void> ResetpasswordOTP_apihit(BuildContext? context) async {
    if (context == null) {
      print("Error: Context is null!");
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();

    loading.value = true;
    Map data = {
      'email': varificationemail,
      'otp': pinController.value.text,
      'language_type': lang,
    };

    _api.ResetpasswordOTPapi(data).then((value) {
      setAccountDetails(value);
      loading.value = false;
      print("Message: ${value.message}");

      if (value.message == "Otp Successfully Match") {
        Get.to(CreatePassword());
      } else {
        Utils.snackBar(context, 'incorrect', 'please retry otp');
      }
    }).onError((error, stackTrace) {
      print(error);
      loading.value = false;
      Utils.snackBar(context, 'Failed', 'Try again'); // error.toString()
    });
  }
}
