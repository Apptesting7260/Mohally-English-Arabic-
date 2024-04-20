import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicHome_Model/ArabichomeModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicHomeView_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = HomeModel_Arabic().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(HomeModel_Arabic value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  void homeview_apihit() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    print(
        "$token==========Home=====================t==o==k==e==n==================");
    loading.value = true;
    Map data = {"page_no": "1", "per_page": "100", "language_type": "Arabic"};
    var header = {'Authorization': "Bearer $token"};
    _api.arabichomepageapi(data, header).then((value) {
      setUserList(value);

      setRxRequestStatus(Status.COMPLETED);
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Home====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      // print("fdfdgfdgfdfdhf");
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
