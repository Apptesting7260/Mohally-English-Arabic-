import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/utils/Utils.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/models/ProductAddReviewModel/productAddreviewModel.dart';
import 'package:mohally/presentation/reviews_screen/reviews_screen.dart';
// import 'package:mohally/repository/Auth_Repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var response;

String? AddreviewProductid;

class AddReviewController extends GetxController {
  final namecontroller = TextEditingController().obs;
  final descriptioncontroller = TextEditingController().obs;
  // final AuthRepository _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = ProductAddReviewModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(ProductAddReviewModel value) => userList.value = value;
  void setError(String value) => error.value = value;
  RxBool loading = false.obs;
  File? imgFile;
  double rating = 0; // Add this variable to store the rating

  void setRating(double value) {
    rating = value; // Update the rating when it changes
    update(); // Notify listeners about the change
  }

  Future<void> AddReviewApiHit() async {
    final sp = await SharedPreferences.getInstance();

    try {
      loading.value = true; // Set loading to true before making the API call
      var url = Uri.parse(
          'https://urlsdemo.net/mohally/api/product-review-store-api');
      var request = http.MultipartRequest('POST', url);
      if (imgFile != null) {
        // Check if imgFile is not null
        print("===imggg${imgFile}");
        var fileStream = http.ByteStream(imgFile!.openRead());
        var length = await imgFile!.length();
        var multipartFile = http.MultipartFile('images', fileStream, length,
            filename: imgFile!.path.split('/').last);
        request.files.add(multipartFile);
        print("==mul${multipartFile.filename}");
      }
      request.fields["product_id"] = AddreviewProductid.toString();
      request.fields['user_name'] = namecontroller.value.text;
      request.fields['description'] = descriptioncontroller.value.text;
      request.fields["ratting"] =
          rating.toString(); // Use the stored rating here
      request.headers['Authorization'] = "Bearer ${sp.getString("token")}";

      // Send the request and get the response
      final streamedResponse = await request.send();
      response = await http.Response.fromStream(streamedResponse);
      var responseBody = response.body;

      print(responseBody);
      // Check the response status
      if (response.statusCode == 200) {
        Get.off(ReviewsScreen());
      } else {
        Utils2.snackBar('Failed', '');
      }
    } catch (e) {
      print(e);
      Utils2.snackBar('Failed', '$e');
    } finally {
      loading.value = false;
    }
  }
}
