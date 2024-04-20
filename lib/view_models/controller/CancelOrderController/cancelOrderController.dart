import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/CancelOrderModel/cancelordermodel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Orderid;

class CancelOrderController extends GetxController {
  final _api = AuthRepository();
  final loading = false.obs;
  final statusOfApi = ''.obs;
  final error = ''.obs;
  final userlist = CancelOrderModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setAccountDetails(CancelOrderModel value) => userlist.value = value;

  void setError(String value) => error.value = value;

  Future<void> orderCancelHit(
    BuildContext context,
  ) async {
    loading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    Map data = {"order_id": Orderid};

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.CancelOrder(data, header).then((value) {
      loading.value = false;
      print(data);
      setAccountDetails(value);
      rxRequestStatus.value = Status.COMPLETED;
      // if (value.status == true) {
      //   Get.off(MyOrdersTabContainerScreen());
      // } else {
      //   setRxRequestStatus(Status.ERROR);
      // }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      setRxRequestStatus(Status.ERROR);
    });
  }
}
