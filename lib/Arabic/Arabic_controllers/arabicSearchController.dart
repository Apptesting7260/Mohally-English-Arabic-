import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_Models/ArabicSearchModel/arabic_SearchModel.dart';
import 'package:mohally/data/response/status.dart';
// import 'package:mohally/models/SearchModel/EnglishSearchModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArabicSearchController extends GetxController {
  final AuthRepository _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final products = ArabicSeachModel().obs;
  RxString error = ''.obs;
  RxString searchText = ''.obs;
  // final searchtext = TextEditingController().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setProducts(ArabicSeachModel value) => products.value = value;
  void setError(String value) => error.value = value;

  RxBool loading = false.obs;

  void searchProducts(String searchText) async {
    this.searchText.value = searchText; // Set the searchText
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();

    print("$token==========Search=====================Token==================");
    loading.value = true;
    Map data = {"pro_name": searchText, "language_type": "Arabic"};
    var header = {'Authorization': "Bearer $token"};

    _api.ArabicProductSearchByNameApi(data, header).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProducts(value);
      print('Printing search results:');
      print(value);
      loading.value = false;
    }).onError((error, stackTrace) {
      print("=====Search======Error======");
      print(error.toString());
      print(stackTrace.toString());
      loading.value = false;
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
