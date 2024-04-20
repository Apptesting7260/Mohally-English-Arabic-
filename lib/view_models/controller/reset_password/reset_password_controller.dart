import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/reset_password_model/reset_password_model.dart';
import 'package:mohally/presentation/verification_code_screen/verification_code_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? varificationemail;

class Resetpassword_controller extends GetxController {
  final _api = AuthRepository();

  final emailController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxString error = ''.obs;
  RxString statusOfApi = ''.obs;
  final forgetpasswordModel = ResetpasswordModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setAccountDetails(ResetpasswordModel value) =>
      forgetpasswordModel.value = value;
  void setError(String value) => error.value = value;

  Future<void> resetPasswordApiHit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'language_type': lang,
    };

    await _api.Resetpasswordapi(data).then((value) {
      setAccountDetails(value);
      loading.value = false;

      if (value.message == " Otp Send On Your Email") {
        Utils.snackBar(context, 'Success', value.message.toString());
        varificationemail = emailController.value.text;

        // Pass the email to OtpVerification
        Get.to(VerificationCodeScreen(
          emailText: emailController.value.text,
          controller: TextEditingController(),
          pinPutFocusNode: FocusNode(),
        ));
      } else {
        Utils.snackBar(context, "Error", value.message.toString());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils2.snackBar('Incorrect', 'Please check your email');
      return; // error.toString()
    });
  }

  Future<bool> resendOtp(String email, String language) async {
    try {
      loading.value = true;

      // Make the API call to resend OTP
      ResetpasswordModel value = await _api.Resetpasswordapi({
        'email': email,
        'language_type': language,
      });

      // Check the response and return a boolean indicating success or failure
      if (value.message == " Otp Send On Your Email") {
        return true;
      } else {
        setError(value.message.toString());
        return false;
      }
    } catch (error) {
      print("Error: $error");
      setError('Failed to Resend OTP');
      return false;
    } finally {
      loading.value = false;
    }
  }
}
