import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          height: 710.v,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 21.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup22,
                        height: 232.v,
                        width: 279.h,
                      ),
                      SizedBox(height: 39.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 39.h),
                          child: Text(
                            "Order Confirmed",
                            style: theme.textTheme.headlineMedium,
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
                          "Your order has been confirmed, we will send you confirmation email shortly.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyLargeGray50001_3.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                      SizedBox(height: 73.v),
                      CustomElevatedButton(
                        onPressed: () {
                          Get.offAll(TabScreen(
                            index: 0,
                          ));
                        },
                        text: "Continue Shopping",
                        buttonStyle: CustomButtonStyles.fillPrimary,
                      ),
                    ],
                  ),
                ),
              ),
              // CustomOutlinedButton(
              //   onPressed: () {
              //     Get.to(() => MyOrdersTabContainerScreen());
              //   },
              //   width: 315.h,
              //   text: 'Go to orders',
              //   margin: EdgeInsets.only(bottom: 5.v),
              //   buttonStyle: CustomButtonStyles.outlineGrayTL25,
              //   buttonTextStyle: theme.textTheme.titleMedium!,
              //   alignment: Alignment.bottomCenter,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Order Confirmed",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
