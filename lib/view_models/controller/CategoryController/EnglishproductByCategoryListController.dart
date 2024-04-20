import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductsByMainCatIdModel/WomensSubCatViewModel/SubCategoryProductModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsByCatIdListControllerEnglish extends GetxController {
  /// for filter screen
  var expandColorAndSize = [false, false].obs;
  var expandDetailAndCollarStyle = [false, false].obs;
  var selectedColorAndSizeIndex = [-1, -1].obs;
  var selectedDetailAndCollarStyleIndex = [-1, -1].obs;

  ///
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final userlist = SubCategoryProducts().obs;
  void setAccountDetails(SubCategoryProducts value) => userlist.value = value;

  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void ProductByCatId_apiHit(String EnglishproductbyCatId) async {
    
    loading.value = true;
    Map data = {
      "cat_id": EnglishproductbyCatId.toString(),
      "language_type": "English",
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.ProductByCatListApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setAccountDetails(value);
      // if (value.status == true) {
      //   setAccountDetails(value);
      // } else {
      //   setRxRequestStatus(Status.ERROR);
      //   Get.to(NoProductFound(
      //     showAppBar: true,
      //   ));
      // }
    }).onError((error, stackTrace) {
      print("=====Sub====Cat======ProductView Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
