import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/EnglishAdd_to_cart_Model/EnglishaddtocartModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Englishcartproductid;
String? EnglishAddtocartquantity;
String? EnglishAddtocartColor;
String? EnglishAddtocartSize;
String? EnglishAddtocartprice;
String? EnglishAddtocartModelId;
String? EnglishAddtocartItem;
String? EnglishAddtocartWeight;
String? EnglishAddtocarQuantityy;
String? EnglishAddtocarCapacity;

Map<String, String> productDetails = {};

class AddToCartcontroller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  RxString sizeid = ''.obs;
  RxString colorId = ''.obs;
  RxString color = ''.obs;
  RxString size1 = ''.obs;
  final signupModel = EnglishAddtoCartModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(EnglishAddtoCartModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> addtocart_Apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    addIfNotNull(productDetails, 'Color', EnglishAddtocartColor?.toString());
    addIfNotNull(productDetails, 'Size', EnglishAddtocartSize?.toString());
    addIfNotNull(productDetails, 'Model', EnglishAddtocartModelId?.toString());
    addIfNotNull(productDetails, 'Items', EnglishAddtocartItem?.toString());
    addIfNotNull(productDetails, 'Weight', EnglishAddtocartWeight?.toString());
    addIfNotNull(
        productDetails, 'Quantity', EnglishAddtocarQuantityy?.toString());
    addIfNotNull(
        productDetails, 'Capacity', EnglishAddtocarCapacity?.toString());
    loading.value = true;

    Map<String, dynamic> data = {
      'product_id': Englishcartproductid.toString(),
      'total_quantity': EnglishAddtocartquantity.toString(),
      'price': EnglishAddtocartprice.toString(),
      'coupon': "".toString(),
      'product_details': productDetails.isNotEmpty
          ? json.encode(productDetails)
          : null.toString(), // Encode the map to JSON
      'language_type': 'English'
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    try {
      final response = await _api.AddtocartApi(data, header);
      loading.value = false;
      print(data);
      print("Message: ${response.message}");
      if (response.status == true) {
        Get.back();
        Utils.snackBar(context, 'Success', response.message.toString());
        // color.value = '';
        // size1.value = '';
        // colorId.value = '';
        // sizeid.value = '';
      } else {
        Utils.snackBar(context, 'Failed', response.message.toString());
      }
    } catch (error) {
      loading.value = false;
      Utils.snackBar(context, 'Failed', error.toString());
    }
  }

  void addIfNotNull(Map<String, String> map, String key, String? value) {
    if (value != null && value != 'null') {
      map[key] = value;
    }
  }
}
