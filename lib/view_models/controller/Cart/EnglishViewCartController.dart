import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/English_ViewCartModel/english_viewCartModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnglishViewCart extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = EnglishViewcartModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(EnglishViewcartModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void Viewcart_apihit() async {
    loading.value = true;
    Map data = {
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.viewcartApi(data, header).then((value) {
      print("viewCart successful");
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing cart View Value ');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("cartview error: $error");
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
