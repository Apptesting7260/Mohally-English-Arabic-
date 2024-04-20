
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/MyAccount_Model/myAccount_model.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final MyAccount = MyAccountModal().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setaccountdetails(MyAccountModal value) => MyAccount.value = value;
  void setError(String value) => error.value = value;
  final RxBool isLoading = false.obs;
  Future<void> fetchMyAccountData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('selectedLanguage').toString();
    Map data = {'language_type': lang};
    setRxRequestStatus(Status.LOADING);
    _api.myAccountapi(data).then((value) {
      setaccountdetails(value);
      setRxRequestStatus(Status.COMPLETED);
      print(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
    });
  }
}
