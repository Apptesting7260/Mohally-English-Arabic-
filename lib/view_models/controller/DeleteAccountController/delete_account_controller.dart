import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/DeleteAccount/DeleteAccountModel.dart';
import 'package:mohally/presentation/splash_screen/splash_screen.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountController extends GetxController {
  // ignore_for_file: unused_local_variable
  // ignore: unused_field
  final _api = AuthRepository();
   final rxRequestStatus = Status.LOADING.obs;
   final deleteMyAccount = DeleteAccountModel().obs;
    
    RxBool loading = false.obs;
    Future<void> deleteUserData() async {
      
      loading.value = true;
  final sp = await SharedPreferences.getInstance();
  var token ='token';
   var lang =sp.getString('selectedLanguage');
    try {
      http.Response response = await http.delete(
        Uri.parse(AppUrl.deleteMyAccount),
        headers: {
          'Authorization': "Bearer ${sp.getString("token")
          }"
        },
      );print("Bearer ${sp.getString("token")}");
         loading.value = false;
      print(response.statusCode);
      if (response.statusCode == 200) {
     loading.value = false;
     sp.remove('token');
     sp.remove('selectedLanguage');
      //  Utils2.snackBar('Success', 'Deleted Successfully');
       Get.offAll(SplashScreen());
      } onError(error, stackTrace) {
        loading.value = false;
      Utils2.snackBar('Failed', 'Failed ');
        throw jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
