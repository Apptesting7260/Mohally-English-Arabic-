import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:mohally/view_models/controller/reset_password/reset_password_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createpass_controller extends GetxController {


  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final passwordController = TextEditingController().obs ;
  final confirmpasswordController = TextEditingController().obs ;


  RxBool loading = false.obs;


  Future<void> Createpass_apihit(BuildContext? context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     String lang= prefs.getString('selectedLanguage').toString();
     print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true ;
    Map data = {
      'email':   varificationemail,
      'password' : passwordController.value.text,
      'confirm_password' : confirmpasswordController.value.text,
      'language_type':lang

    };
    print(data);

    _api.Createpassapi(data).then((value){
       print("Message: ${value.message}");
      loading.value = false ;
      if(value.message == "Password Successfully Updated"){
      Get.offAll(  ()=>LoginScreen() );
      Utils.snackBar(context!, 'Success',"Password Successfully Updated");
      }
      else{
         print("Error during password update: ${value.message}");
    Utils.snackBar(context!, 'Error', value.message.toString());
        //  Utils.snackBar(context!, 'Error',value.message.toString());
      }

    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar(context!,'Failed','Try again');   // error.toString()
    });
  }
}