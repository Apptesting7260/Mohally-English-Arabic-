import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_address.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Createaddress_controller extends GetxController {
  // RxBool isAddressPrimary = false.obs;
  final _api = AuthRepository();
  RxBool loading = false.obs;
  final nameEditTextController = TextEditingController().obs;
  final addressEditTextController = TextEditingController().obs;
  final cityEditTextController = TextEditingController().obs;
  final countrycontroller = TextEditingController().obs;
  final statecontroller = TextEditingController().obs;
  final zipcodeEditTextController = TextEditingController().obs;
  final group184EditTextController = TextEditingController().obs;
  Future<void> createaddress_apihit(BuildContext context) async {
    loading.value = true;
    var data = {
      'user_name': nameEditTextController.value.text,
      'address': addressEditTextController.value.text,
      'city': cityEditTextController.value.text,
      'country': countrycontroller.value.text,
      'state': statecontroller.value.text,
      'zip_code': zipcodeEditTextController.value.text,
      'mobile_number': group184EditTextController.value.text,
      'address_status': 'active',
      //isAddressPrimary.value ? 'active' : 'inactive',
      'language_type': 'Arabic',
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    print(header);
    print("$token======create===t==o==k==e==n==================");
    print(data);
    // print(userid.value);
    _api.arabic_addnewaddressApi(data, header).then((value) {
      loading.value = false;
      Get.off(() => addresses_arabic());
      // _showVerificationDialog(context);
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    });
  }
  //    void toggleAddressStatus() {
  //   isAddressPrimary.value = !isAddressPrimary.value;
  // }
}
