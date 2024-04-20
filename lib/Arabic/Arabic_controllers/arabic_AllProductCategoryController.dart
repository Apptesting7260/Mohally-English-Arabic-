import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_AllProductViewModel/arabic_allproductViewModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicAllProduct_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = arabicAllProductViewModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(arabicAllProductViewModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void allProductView_apihit() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    print(
        "$token==========Home=====================t==o==k==e==n==================");
    loading.value = true;
    Map data = {"language_type": "Arabic"};
    var header = {'Authorization': "Bearer $token"};
    _api.arabic_allcategoryproductview(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("=====All Product====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
