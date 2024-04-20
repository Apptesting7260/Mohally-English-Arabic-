import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_forget_password_controller.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class arabic_Createpass_controller extends GetxController {
  final _api = AuthRepository();
// MySharedPreferences mySharedPreferences = MySharedPreferences();
  final passwordController = TextEditingController().obs;
  final confirmpasswordController = TextEditingController().obs;
  RxBool loading = false.obs;

  Future<void> arabic_Createpass_apihit(BuildContext? context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true;
    Map data = {
      'email': varificationemail,
      'password': passwordController.value.text,
      'confirm_password': confirmpasswordController.value.text,
      'language_type': lang
    };

    print(data);
    _api.Createpassapi(data).then((value) {
      loading.value = false;
      Get.offAll(() => LoginScreen_arabic());
      Utils.snackBar(context!, 'نجاح', "تم تحديث كلمة المرور بنجاح");
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar(context!, 'فشل', 'حاول ثانية'); // error.toString()
    });
  }
}
