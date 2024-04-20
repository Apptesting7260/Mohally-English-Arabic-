import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductPriceCangeByAttributeModel/ProductpricechangebyAttributeModel.dart';
import 'package:mohally/presentation/single_page_screen/SingleProductViewScreen/SingleProductView.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? pid;
String? productColor;
String? productSize;
String? productweight;
String? productQuantity;
String? productItem;
String? productCapacity;
String? productModel;

Map<String, String> productpricechangeDetails = {};

class ProductPriceChngeByAttribute extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  RxString productPrice = ''.obs;
  RxString totalQuantity = ''.obs;
  RxInt Productincart = 0.obs;
  final userlist = ProductPriceChangeByAttributeModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(ProductPriceChangeByAttributeModel value) =>
      userlist.value = value;

  void setError(String value) => error.value = value;

  Future<void> ProductPriceChangeByAttribute(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    addIfNotNull(productpricechangeDetails, 'Color', productColor?.toString());
    addIfNotNull(productpricechangeDetails, 'Size', productSize?.toString());
    addIfNotNull(
        productpricechangeDetails, 'Weight', productweight?.toString());
    addIfNotNull(
        productpricechangeDetails, 'Quantity', productQuantity?.toString());
    addIfNotNull(productpricechangeDetails, 'Items', productItem?.toString());
    addIfNotNull(productpricechangeDetails, 'Model', productModel?.toString());
    addIfNotNull(
        productpricechangeDetails, 'Capacity', productCapacity?.toString());

    loading.value = true;

    Map<String, dynamic> data = {
      'product_id': pid.toString(),
      'product_attribute': json.encode(productpricechangeDetails),
      'language_type': 'English'
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    try {
      final response = await _api.ProductPriceChangeByAttribute(data, header);
      loading.value = false;
      print(data);
      print("Message: ${response.message}");
      if (response.status == true) {
        productPrice.value = response.data?.price ?? '';
        Productincart.value = response.data?.cartId ?? '';
        totalQuantity.value = response.data?.totalQuantity ?? '';
      } else {
        Utils.snackBar(context, 'Failed', response.message.toString());
        AselectedcolorIndex.value = (-1);
        AselectedSizeIndex.value = (-1);
        AselectedModelIndex.value = (-1);
        AselecteditemIndex.value = (-1);
        AselectedCapacityIndex.value = (-1);
        AselectedquantityIndex.value = (-1);
        AselectedweightIndex.value = (-1);
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
