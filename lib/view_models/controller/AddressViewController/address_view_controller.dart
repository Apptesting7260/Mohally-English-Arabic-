import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/User_address_view_Model/user_address_view_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Englishuseraddressviewcontroller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserAddressViewModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserAddressViewModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void UseraddressView_apihit() async {
    loading.value = true;
    Map data = {
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.userAddressviewApi(data, header).then((value) {
      print("UseraddressView_apihit successful");
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print("${value.userAddress!.length}===useraddresslength");
      print('printing UserAddress View Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("UseraddressView_apihit error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
