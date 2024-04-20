import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicAddtoCartModel/ArabicaddtocartModel.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Arabiccartproductid;
String? ArabicAddtocartquantity;
String? ArabicAddtocartColor;
String? ArabicAddtocartSize;
String? ArabicAddtocartprice;
String? ArabicAddtocartModelId;
String? ArabicAddtocartItemlId;
String? ArabicAddtocartCapacitylId;
String? ArabicAddtocartWeightlId;
String? ArabicAddtocartQuantitylId;


Map<String, String> productDetails = {};

class arabic_addtocart_controller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = ArabicAddtoCartModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(ArabicAddtoCartModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> addtocart_Apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    addIfNotNull(productDetails, 'Color', ArabicAddtocartColor?.toString());
    addIfNotNull(productDetails, 'Size', ArabicAddtocartSize?.toString());
    addIfNotNull(productDetails, 'Model', ArabicAddtocartModelId?.toString());
    addIfNotNull(productDetails, 'Items', ArabicAddtocartItemlId?.toString());
     addIfNotNull(productDetails, 'Weight', ArabicAddtocartWeightlId?.toString());
    addIfNotNull(
        productDetails, 'Quantity', ArabicAddtocartQuantitylId?.toString());
    addIfNotNull(
        productDetails, 'Capacity', ArabicAddtocartCapacitylId?.toString());
    loading.value = true;

    Map<String, dynamic> data = {
      'product_id': Arabiccartproductid.toString(),
      'total_quantity': ArabicAddtocartquantity.toString(),
      'price': ArabicAddtocartprice.toString(),
      'coupon': "".toString(),
      'product_details': json.encode(productDetails), // Encode the map to JSON
      'language_type': 'Arabic'
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.arabic_AddtocartApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      if (value.status == true) {
        Get.back();
        Utils.snackBar(context, 'Success', value.message.toString());
      } else {
        Utils.snackBar(context, 'Failed', value.message.toString());
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    });
  }

  void addIfNotNull(Map<String, String> map, String key, String? value) {
    if (value != null && value != 'null') {
      map[key] = value;
    }
  }
}
