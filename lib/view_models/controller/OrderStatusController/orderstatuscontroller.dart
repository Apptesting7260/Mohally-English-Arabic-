import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/OrderStatusModel/orderstatusModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderStatuscontroller extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final Userlist = OrderStatusModel().obs;
  final rxRequestStatus = Status.LOADING.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(OrderStatusModel value) => Userlist.value = value;
  void setError(String value) => error.value = value;

  Future<void> OrderStatus_Apihit(
    BuildContext context,
    String orderStatus,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    loading.value = true;

    Map data = {'order_status': orderStatus}; // Pass orderStatus here

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.OrderStatusApi(data, header).then((value) {
      loading.value = false;
      print(data);
      print("Message: ${value.message}");
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      if (value.status == true) {
        // Handle successful response here
      } else {
        setRxRequestStatus(Status.ERROR);
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      setRxRequestStatus(Status.ERROR); // Set status to ERROR
    });
  }
}
