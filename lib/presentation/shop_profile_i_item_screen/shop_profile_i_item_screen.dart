import 'package:get/get.dart';

import '../shop_profile_i_item_screen/widgets/shopprofileiitem_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';

class ShopProfileIItemScreen extends StatelessWidget {
  const ShopProfileIItemScreen({Key? key})
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
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 18.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.v),
              _buildFollow1(context),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    Text(
                      "Items_",
                      style: theme.textTheme.titleMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "categories_",
                        style: CustomTextStyles.bodyLargeGray5000118,
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
              SizedBox(height: 17.v),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.v),
                      child: Text(
                        "relevanve_".tr,
                        style: CustomTextStyles.titleSmallSemiBold_1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "top_sales".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.h,
                        bottom: 1.v,
                      ),
                      child: Text(
                        "most_recent".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              _buildShopProfileIItem(context),
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
  Widget _buildFollow(BuildContext context) {
    return CustomOutlinedButton(
      height: 30.v,
      width: 210.h,
      text: "Follow_".tr,
      buttonStyle: CustomButtonStyles.outlinePrimaryTL151,
      buttonTextStyle: CustomTextStyles.titleSmallWhiteA70002,
    );
  }

  /// Section Widget
  Widget _buildFollow1(BuildContext context) {
    return Container(
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
                _buildFollow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildShopProfileIItem(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 265.v,
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.h,
            ),
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ShopprofileiitemItemWidget();
            },
          ),
        ),
      ),
    );
  }
}
