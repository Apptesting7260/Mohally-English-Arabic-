import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductViewReviewModel/productviewreviewmodel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewReviewController extends GetxController {
  final _api = AuthRepository();
  final loading = false.obs;
  final statusOfApi = ''.obs;
  final error = ''.obs;
  final userlist = ProductViewReviewModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setAccountDetails(ProductViewReviewModel value) =>
      userlist.value = value;

  void setError(String value) => error.value = value;

  Future<void> reviewViewapiHit(BuildContext context, String productId) async {
    loading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    Map data = {"product_id": productId};

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    _api.ProductviewReview(data, header).then((value) {
      loading.value = false;
      print(data);
      rxRequestStatus.value = Status.COMPLETED;
      if (value.status == true) {
        setAccountDetails(value);
      } else {
        setRxRequestStatus(Status.ERROR);
      }
    }).onError((error, stackTrace) {
      print('$error');
      loading.value = false;
      setRxRequestStatus(Status.ERROR);
    });
  }
}
