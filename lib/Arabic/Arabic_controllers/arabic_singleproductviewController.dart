import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/Arabic_ProductViewModel/ArabicSingleProductView/ArabicSingleviewModel.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicSingleProductViewController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userlist = ArabicSingleProductViewModel().obs;

  // final userList = Rx<dynamic>(null);
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setAccountDetails(ArabicSingleProductViewModel value) =>
      userlist.value = value;

  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  Single_ProductApiHit(String MainCatId, String productid) async {
    loading.value = true;

    print(productid);
    print("object========");
    Map data = {
      "main_category_id": MainCatId.toString(),
      "product_id": productid,
      "language_type": "Arabic"
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.SingleproductviewApi(data, header).then((value) {
      setAccountDetails(value);
      setRxRequestStatus(Status.COMPLETED);

      // setUserList(value);
      // print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      // print(value);
      // loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Arabicsingle====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
