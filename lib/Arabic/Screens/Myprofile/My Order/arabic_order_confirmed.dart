// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_HomeTab.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';

class OrderConfirmedScreen_arabic extends StatelessWidget {
  const OrderConfirmedScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 780.v,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 43.v),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.all(30.h),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.imgGroup35,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 40.v),
                            CustomImageView(
                              imagePath: ImageConstant.imgGroup22,
                              height: 232.v,
                              width: 279.h,
                            ),
                            SizedBox(height: 39.v),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 39.h),
                                child: Text(
                                  "تم تاكيد الطلب!",
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(fontFamily: 'Almarai'),
                                ),
                              ),
                            ),
                            SizedBox(height: 19.v),
                            Container(
                              width: 288.h,
                              margin: EdgeInsets.only(
                                left: 13.h,
                                right: 12.h,
                              ),
                              child: Text(
                                  "لقد تم تأكيد طلبك، وسوف نرسل لك رسالة تأكيد بالبريد الإلكتروني قريبا.",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Almarai',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  )),
                            ),
                            SizedBox(
                              height: Get.height * .1,
                            ),
                            CustomElevatedButton(
                                onPressed: () {
                                  Get.offAll(arabic_TabScreen(
                                    index: 0,
                                  ));
                                },
                                text: "مواصلة التسوق",
                                buttonStyle: CustomButtonStyles.fillPrimary,
                                buttonTextStyle: theme.textTheme.titleMedium
                                    ?.copyWith(
                                        fontFamily: 'Almarai',
                                        color: Colors.white)),
                            // SizedBox(
                            //   height: Get.height * .05,
                            // ),
                            // CustomOutlinedButton(
                            //   width: 315.h,
                            //   text: 'اذهب إلى الطلبات',
                            //   margin: EdgeInsets.only(bottom: 5.v),
                            //   buttonStyle: CustomButtonStyles.outlineGrayTL25,
                            //   buttonTextStyle: theme.textTheme.titleMedium
                            //       ?.copyWith(fontFamily: 'Almarai'),
                            //   alignment: Alignment.bottomCenter,
                            //   onPressed: (){
                            //     Get.
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
}
