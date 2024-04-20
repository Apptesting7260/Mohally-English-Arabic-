import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_update_controller.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/Singe_Product_ViewModel/single_product_view_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnglishSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString totalQuantity = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userlist = SingleProductViewModel().obs;

  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;

  void setAccountDetails(SingleProductViewModel value) =>
      userlist.value = value;

  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void Single_ProductApiHit(BuildContext context, String Englishproductid,
      String EnglishMainCatId) async {
    loading.value = true;
    print("$EnglishMainCatId==============main_cat");

    print(Englishproductid);
    print("object========");
    Map data = {
      "main_category_id": EnglishMainCatId.toString(),
      "product_id": Englishproductid.toString(),
      "language_type": "English"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.EnglishSingleproductviewApi(data, header).then((value) {
      // Get.back();
      setAccountDetails(value);

      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
