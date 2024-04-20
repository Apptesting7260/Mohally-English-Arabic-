import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/response/status.dart';

class Updateaddress_controller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  final nameEditTextController1 = TextEditingController().obs;
  final addressEditTextController1 = TextEditingController().obs;
  final cityEditTextController1 = TextEditingController().obs;
  final californiaEditTextController1 = TextEditingController().obs;
  final countrycontroller = TextEditingController().obs;
  final zipcodeEditTextController1 = TextEditingController().obs;
  final group184EditTextController1 = TextEditingController().obs;
  RxString addressid=''.obs;

  Future<void> Updateaddress_apihit() async {
    loading.value = true;
    Map data = {
      'address_id':addressid.value,
      'user_name': nameEditTextController1.value.text,
      'address': addressEditTextController1.value.text,
      'city': cityEditTextController1.value.text,
      'country': countrycontroller.value.text,
      'state': californiaEditTextController1.value.text,
      'zip_code': zipcodeEditTextController1.value.text,
      'mobile_number': group184EditTextController1.value.text,
      'address_status': 'active',
      'language_type':'Arabic'
    };
    
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
     var header = {'Authorization': "Bearer $token"};
    print(data);
      _api.arabic_editnewaddress(data,header).then((value) {
       loading.value = false;
        Get.back(result: true);
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils2.snackBar('Retry', 'Try Again'); // error.toString()
    });
  }
}
