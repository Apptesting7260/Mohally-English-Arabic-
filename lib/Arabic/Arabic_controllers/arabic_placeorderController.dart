// ignore_for_file: unused_import
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_address.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/Arabic/Screens/Myprofile/My%20Order/arabic_order_confirmed.dart';
import 'package:mohally/Arabic/Screens/Welcome_screens/arabic_login_screen.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/PlaceOrderModel/placeorderModel.dart';
import 'package:mohally/models/Sign_Up_Model/sign_up_model.dart';
import 'package:mohally/presentation/login_screen/login_screen.dart';
import 'package:mohally/presentation/shipping_addresses_screen/shipping_addresses_screen.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? arabiccouponid;
String? arabicaddress_id;
String? arabicsubtotalAmout;
String? arabicitemdiscountAmount;
String? arabictotalamount;
String? arabicsubtotalamount;

class ArabicPlaceOrdercontroller extends GetxController {
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
    if (arabicaddressIndexId == null || arabicaddress_id!.isEmpty) {
      Utils.snackBar(context, 'Failed',
          'يرجى تحديد عنوان التسليم (Address) لمتابعة عملية الدفع');
      return;
    } else if (ids.isEmpty) {
      Utils.snackBar(context, 'Failed',
          'قبل الشروع في الخروج، يرجى تحديد المنتجات(Products)');
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");
    loading.value = true;
    Map data = {
      "cart_id": ids.toString(),
      "coupon_id": arabiccouponid.toString(),
      "address_id": arabicaddress_id.toString(),
      "sub_total_amount": arabicsubtotalamount.toString(),
      "item_discount_amount": arabicitemdiscountAmount.toString(),
      "total_amount": arabictotalamount.toString(),
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
        Get.offAll(OrderConfirmedScreen_arabic());
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
