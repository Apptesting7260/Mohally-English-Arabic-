import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils_2.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductReviewHelpfulModel/productreviewHelpfulModel.dart';
import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? productreviewProductId;
String? productreviewId;

class ProductReviewHelpful extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;
  RxString error = ''.obs;
  final signupModel = ProductReviewHelpfulModel().obs;
  final rxRequestStatus = Status.LOADING.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaccountdetails(ProductReviewHelpfulModel value) =>
      signupModel.value = value;

  void setError(String value) => error.value = value;

  Future<void> producthelpful_Apihit(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String lang = prefs.getString('selectedLanguage').toString();
    print("${prefs.getString('selectedLanguage').toString()}==========lang");

    loading.value = true;

    Map<String, dynamic> data = {
      "product_id": productreviewProductId.toString(),
      "product_review_id": productreviewId.toString()
    };

    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token').toString();
    var header = {'Authorization': "Bearer $token"};

    try {
      final response = await _api.ProductReviewHelpful(data, header);
      loading.value = false;
      print(data);
      print("Message: ${response.message}");
      if (response.status == true) {
        Utils.snackBar(context, 'Success', response.message.toString());
      } else {
        print('sucesssssssssss');
      }
    } catch (error) {
      loading.value = false;
      print(error);
    }
  }
}
