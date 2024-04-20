import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';

class ShopProfileICategoriesOneScreen extends StatelessWidget {
  const ShopProfileICategoriesOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 22.v),
            child: _buildShopProfileICategories(context),
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
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "ZLNZ",
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingIconbuttonOne(
          imagePath: ImageConstant.imgSearchGray90001,
          margin: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 8.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildShopProfileICategories(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.v),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(20.h),
            decoration: AppDecoration.fillGray10003,
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse88970x70,
                  height: 70.adaptSize,
                  width: 70.adaptSize,
                  radius: BorderRadius.circular(
                    35.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 45.h,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "1.2K+\n",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: "Followers_".tr,
                                    style: CustomTextStyles.bodySmall12,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: SizedBox(
                              height: 30.v,
                              child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                              ),
                            ),
                          ),
                          Container(
                            width: 36.h,
                            margin: EdgeInsets.only(left: 20.h),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "100K+\n",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: "Sold_".tr,
                                    style: CustomTextStyles.bodySmall12,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: SizedBox(
                              height: 30.v,
                              child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                              ),
                            ),
                          ),
                          Container(
                            width: 27.h,
                            margin: EdgeInsets.only(left: 20.h),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "144",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: " \n",
                                    style: CustomTextStyles.titleMediumMedium,
                                  ),
                                  TextSpan(
                                    text: "Items_".tr,
                                    style: CustomTextStyles.bodySmall12,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.v),
                      CustomOutlinedButton(
                        height: 30.v,
                        width: 210.h,
                        text: "Follow_".tr,
                        buttonStyle: CustomButtonStyles.outlinePrimaryTL151,
                        buttonTextStyle: CustomTextStyles.titleSmallWhiteA70002,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.h,
                right: 92.h,
              ),
              child: Row(
                children: [
                  Text(
                    "Items_".tr,
                    style: CustomTextStyles.bodyLargeGray5000118,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "categories_".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.h),
                    child: Text(
                      "Reviews (4.7)",
                      style: CustomTextStyles.bodyLargeGray5000118,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildMenSTopItems(
              context,
              userText: "Men’s hoodies & Sweatshirts (12 items)",
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildMenSTopItems(
              context,
              userText: "Men’s Top (9 items)",
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildMenSTopItems(
              context,
              userText: "Men’s Jackets & Coats (3 items)",
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildMenSTopItems(
              context,
              userText: "Men’s Outdoors Clothing (3 items)",
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMenSTopItems(
    BuildContext context, {
    required String userText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Men’s Top ",
                style: theme.textTheme.bodyLarge,
              ),
              TextSpan(
                text: "(9 items)",
                style: CustomTextStyles.bodyMediumPrimary13,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgVectorGray900019x4,
          height: 9.v,
          width: 4.h,
          margin: EdgeInsets.only(bottom: 4.v),
        ),
      ],
    );
  }
}
