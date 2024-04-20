import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSubCategoryModel/ArabicSubcategoryMensProductView/arabic_mensSubcatJacketModel.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsByCatIdListControllerarabic extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userlist = ArabicSubCategoryProductsModel().obs;
  void setAccountDetails(ArabicSubCategoryProductsModel value) =>
      userlist.value = value;

  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void ProductByCatId_apiHit(String arabicproductbyCatId) async {
    loading.value = true;
    Map data = {
      "cat_id": arabicproductbyCatId.toString(),
      "language_type": "Arabic",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.arabicProductByCatListApi(data, header).then((value) {
      setAccountDetails(value);
      setRxRequestStatus(Status.COMPLETED);
      //  mensApparelModel(value);
    }).onError((error, stackTrace) {
      print("=====Arabic====ProductByCategorylist======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
