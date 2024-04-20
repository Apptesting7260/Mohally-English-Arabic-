import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/OrderDetailsModel/orderDetailsModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsController extends GetxController {
  final _api = AuthRepository();
  final loading = false.obs;
  final statusOfApi = ''.obs;
  final error = ''.obs;
  final userlist = OrderDetailsModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setUserList(OrderDetailsModel value) => userlist.value = value;

  void setError(String value) => error.value = value;

  Future<void> ordeDetailsHit(
    String Orderdetailsid,
  ) async {
    loading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    Map data = {"order_id": Orderdetailsid, "language_type": "English"};

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.OrderDetails(data, header).then((value) {
      loading.value = false;
      print(data);
      setUserList(value);
      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      setRxRequestStatus(Status.ERROR);
    });
  }
}
