import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CouponCodeApply/applyCouponCodeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? CouponId;
String? TotalAmount;

class CouponCodeApplyController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = CouponCodeApplyModel().obs;
  RxString error = ''.obs;
  RxList selectedCartIds = [].obs;
  RxDouble discountPrice = RxDouble(0.0);
  RxDouble totalPrice = RxDouble(0.0);
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(CouponCodeApplyModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void applyCoupon_apihit(BuildContext context, List ids) async {
    if (ids.isEmpty) {
      Utils.snackBar(
          context, 'Failed', 'Before Applying Coupon , please select Products');
      return;
    }
    loading.value = true;
    Map data = {
      "coupon_id": CouponId.toString(),
      "total_amount": TotalAmount.toString(),
      "cart_ids": ids.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.CouponCodeApplyApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      if (value.status == true) {
        discountPrice.value = value.discountPrice?.toDouble() ?? 0.0;
        totalPrice.value = value.totalPrice?.toDouble() ?? 0.0;
        Get.back();
      }

      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("Apply CouponCode error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
