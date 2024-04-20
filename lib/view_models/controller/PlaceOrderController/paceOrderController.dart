// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/PlaceOrderModel/placeorderModel.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/order_confirmed_screen/order_confirmed_screen.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? couponid;
String? address_id;
String? subtotalAmout;
String? itemdiscountAmount;
String? totalamount;
String? subtotalamount;

class PlaceOrdercontroller extends GetxController {
  final _api = AuthRepository();

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = PlaceOrderModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(PlaceOrderModel value) => signupModel.value = value;

  void setError(String value) => error.value = value;
  RxList selectedCartIds = [].obs;

  Future<void> Placeorderapihit(List ids, BuildContext context) async {
    if (addressIndexId == null || address_id!.isEmpty) {
      Utils.snackBar(context, 'Failed',
          'Please select a delivery address to proceed with checkout');
      return;
    } else if (ids.isEmpty) {
      Utils.snackBar(context, 'Failed',
          'Before proceeding to checkout, please select Products');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true;
    Map data = {
      "cart_id": ids.toString(),
      "coupon_id": couponid.toString(),
      "address_id": address_id.toString(),
      "sub_total_amount": subtotalamount.toString(),
      "item_discount_amount": itemdiscountAmount.toString(),
      "total_amount": totalamount.toString(),
      "payment_mode": "cod",
      "payment_transaction_id": ""
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.PlaceOrderApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      setaccountdetails(value);
      setRxRequestStatus(Status.COMPLETED);

      if (value.status == true) {
        Get.offAll(() => OrderConfirmedScreen());
        // Utils.snackBar(context, 'Success', value.message.toString());
        //  varificationemail = emailController.value.text;
      } else {
        Utils.snackBar(context, 'Failed', value.message.toString());
      }
    }).onError((error, stackTrace) {
      print('order place error $error');
      loading.value = false;
      // Utils.snackBar(context, 'Failed', error.toString()); // error.toString()
    });
  }
}
