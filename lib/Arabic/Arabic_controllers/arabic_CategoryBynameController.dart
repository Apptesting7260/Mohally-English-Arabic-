import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubCatModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabiccategorybyNameController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userList = Arabic_SubCategoryModel().obs;
  void setAccountDetails(Arabic_SubCategoryModel value) =>
      userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void CategoryByNameApiHit(String arabicid) async {
    loading.value = true;
    Map data = {
      "language_type": "Arabic",
      "cat_id": arabicid.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.categoriesApi(data, header).then((value) {
      setAccountDetails(value);
      setRxRequestStatus(Status.COMPLETED);

      // print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      // print(value);
      // loading.value = false;
    }).onError((error, stackTrace) {
      print("=====categorybyNameController======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
