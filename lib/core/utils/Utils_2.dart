import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();

    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Color(0xffFE8300),
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Color(0xffFE8300),
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
    );
  }

  static void snackBar(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: Get.height * .06,
                  width: Get.width * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xffFE8300)),
                    ),
                  ),
                ),
              )
              // MyButton(
              //   width: Get.width * .2,
              //   height: Get.height * .06,
              //   title: 'Ok',
              //   onTap: () {
              //   Get.back();
              // },
              //   bgColor: Colors.white,
              //   textColor: Color(0xffFE8300),
              // ),
            ],
            backgroundColor: Color(0xffFE8300),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "OpenSens"),
            contentTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "OpenSens"),
          );
        });
  }
}
