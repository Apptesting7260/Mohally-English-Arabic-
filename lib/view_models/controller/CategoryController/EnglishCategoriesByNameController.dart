import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/SubCategories/subcategoriesModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesByNameControllerEnglish extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  final userList = EnglishSubCategoryModel().obs;

  void setAccountDetails(EnglishSubCategoryModel value) =>
      userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;

  void CategoryByNameApiHit(String EnglishsubMainCatId) async {
    loading.value = true;
    Map data = {
      "language_type": "English",
      "cat_id": EnglishsubMainCatId.toString(),
    };
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};
    _api.english_categoriesApi(data, header).then((value) {
      setAccountDetails(value);
      print("api hitt");
      setRxRequestStatus(Status.COMPLETED);

      // if (value.status == true) {
      //   setAccountDetails(value);
      //   // Get.to(FeaturedCategoryScreen());
      // }
      // else {
      //   setRxRequestStatus(Status.ERROR);
      //   Get.to(NoProductFound(
      //     showAppBar: true,
      //   ));
      // }
    }).onError((error, stackTrace) {
      print("=====Home====Page======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      // error.toString()
    });
  }
}
