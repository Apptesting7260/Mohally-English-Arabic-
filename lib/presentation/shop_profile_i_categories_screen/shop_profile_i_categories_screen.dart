import 'package:get/get.dart';

import '../shop_profile_i_categories_screen/widgets/photoslist1_item_widget.dart';
import '../shop_profile_i_categories_screen/widgets/photoslist2_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_drop_down.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class ShopProfileICategoriesScreen extends StatelessWidget {
  ShopProfileICategoriesScreen({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 2.v),
          child: Column(
            children: [
              SizedBox(height: 22.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFollowRow(context),
                        SizedBox(height: 27.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.h,
                            right: 90.h,
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
                                  style: CustomTextStyles.bodyLargeGray5000118,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 21.h),
                                child: Text(
                                  "Reviews (4.7)",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 23.v),
                        _buildFortyEightRow(context),
                        SizedBox(height: 29.v),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                            children: [
                              CustomDropDown(
                                width: 122.h,
                                icon: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      6.h, 12.v, 12.h, 12.v),
                                  child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgVectorGray900013x6,
                                    height: 4.v,
                                    width: 8.h,
                                  ),
                                ),
                                hintText: "Recommended_".tr,
                                items: dropdownItemList,
                                onChanged: (value) {},
                              ),
                              CustomOutlinedButton(
                                height: 28.v,
                                width: 94.h,
                                text: "With_photos".tr,
                                margin: EdgeInsets.only(left: 10.h),
                                buttonStyle: CustomButtonStyles.outlineGrayTL14,
                                buttonTextStyle:
                                    CustomTextStyles.bodyMediumGray90001_1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 31.v),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: _buildRonaldRichards(
                            context,
                            userName: "Ronald Richards",
                            userClockText: "13 Sep, 2020",
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: CustomRatingBar(
                            initialRating: 5,
                            itemSize: 14,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Container(
                          width: 138.h,
                          margin: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "Purchase : Black/L(40)\nOverall : True to size",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMedium15.copyWith(
                              height: 1.33,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.v),
                        Container(
                          width: 322.h,
                          margin: EdgeInsets.only(
                            left: 20.h,
                            right: 32.h,
                          ),
                          child: Text(
                            "Lorem".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style:
                                CustomTextStyles.bodyMediumGray9000115.copyWith(
                              height: 1.33,
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        _buildPhotosList(context),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: _buildShareOne(
                            context,
                            share: "Share_".tr,
                            helpfulTwo: "Helpful_".tr,
                          ),
                        ),
                        SizedBox(height: 20.v),
                        _buildLuxuryRhinestoneRow(context),
                        SizedBox(height: 20.v),
                        Opacity(
                          opacity: 0.15,
                          child: Align(
                            alignment: Alignment.center,
                            child: Divider(
                              color: appTheme.gray90001.withOpacity(0.4),
                              indent: 20.h,
                              endIndent: 20.h,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: _buildRonaldRichards(
                            context,
                            userName: "Ronald Richards",
                            userClockText: "13 Sep, 2020",
                          ),
                        ),
                        SizedBox(height: 20.v),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: CustomRatingBar(
                            initialRating: 5,
                            itemSize: 14,
                          ),
                        ),
                        SizedBox(height: 8.v),
                        Container(
                          width: 138.h,
                          margin: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "Purchase : Black/L(40)\nOverall : True to size",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMedium15.copyWith(
                              height: 1.33,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.v),
                        Container(
                          width: 322.h,
                          margin: EdgeInsets.only(
                            left: 20.h,
                            right: 32.h,
                          ),
                          child: Text(
                            "Lorem".tr,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style:
                                CustomTextStyles.bodyMediumGray9000115.copyWith(
                              height: 1.33,
                            ),
                          ),
                        ),
                        SizedBox(height: 13.v),
                        _buildPhotosList1(context),
                        SizedBox(height: 14.v),
                        Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: _buildShareOne(
                            context,
                            share: "Share_".tr,
                            helpfulTwo: "Helpful_".tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildLuxuryRhinestoneRow1(context),
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
  Widget _buildFollowRow(BuildContext context) {
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
    );
  }

  /// Section Widget
  Widget _buildFortyEightRow(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15.v,
                bottom: 22.v,
              ),
              child: Column(
                children: [
                  Text(
                    "4.8",
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(height: 3.v),
                  Text(
                    "602 reviews",
                    style: CustomTextStyles.bodySmallInterGray90001,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 224.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: CustomRatingBar(
                          initialRating: 5,
                          itemSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: Container(
                          height: 6.v,
                          width: 82.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.84,
                              backgroundColor: appTheme.gray30001,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.orange400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "85.5%",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Container(
                  width: 214.h,
                  margin: EdgeInsets.only(right: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: CustomRatingBar(
                          initialRating: 5,
                          itemSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: Container(
                          height: 6.v,
                          width: 82.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.12,
                              backgroundColor: appTheme.gray30001,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.orange400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "7.5%",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Container(
                  width: 215.h,
                  margin: EdgeInsets.only(right: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: CustomRatingBar(
                          initialRating: 5,
                          itemSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: Container(
                          height: 6.v,
                          width: 82.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.1,
                              backgroundColor: appTheme.gray30001,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.orange400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "2.5%",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Container(
                  width: 214.h,
                  margin: EdgeInsets.only(right: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: CustomRatingBar(
                          initialRating: 5,
                          itemSize: 14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: Container(
                          height: 6.v,
                          width: 82.h,
                          decoration: BoxDecoration(
                            color: appTheme.gray30001,
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              3.h,
                            ),
                            child: LinearProgressIndicator(
                              value: 0.05,
                              backgroundColor: appTheme.gray30001,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                appTheme.orange400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "1.5%",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                Container(
                  width: 216.h,
                  margin: EdgeInsets.only(right: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: CustomRatingBar(
                          initialRating: 5,
                          itemSize: 14,
                        ),
                      ),
                      Container(
                        height: 6.v,
                        width: 82.h,
                        margin: EdgeInsets.symmetric(vertical: 5.v),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 82.h,
                                child: Divider(
                                  color: appTheme.gray30001,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 6.adaptSize,
                                width: 6.adaptSize,
                                decoration: BoxDecoration(
                                  color: appTheme.orange400,
                                  borderRadius: BorderRadius.circular(
                                    3.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "3.2%",
                        style: CustomTextStyles.bodyMediumInterGray90001,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhotosList(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 95.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 10.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Photoslist1ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLuxuryRhinestoneRow(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.fillGray10003.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle56960x60,
              height: 60.adaptSize,
              width: 60.adaptSize,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.h,
                top: 11.v,
                bottom: 11.v,
              ),
              child: _buildLuxuryRhinestone(
                context,
                luxuryRhinestone: "Luxury Rhinestone Quartz...",
                price: "99 120",
                off: "-20 off",
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 12.v,
                bottom: 11.v,
              ),
              child: CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(7.h),
                decoration: IconButtonStyleHelper.fillPrimaryTL18,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup239533,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhotosList1(BuildContext context) {
    return SizedBox(
      height: 80.v,
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 95.h,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 10.h,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Photoslist2ItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLuxuryRhinestoneRow1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 35.h,
        right: 35.h,
        bottom: 55.v,
      ),
      decoration: AppDecoration.fillGray10003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle56960x60,
            height: 60.adaptSize,
            width: 60.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              bottom: 11.v,
            ),
            child: _buildLuxuryRhinestone(
              context,
              luxuryRhinestone: "Luxury Rhinestone Quartz...",
              price: "99 120",
              off: "-20 off",
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 12.v,
              bottom: 11.v,
            ),
            child: CustomIconButton(
              height: 36.adaptSize,
              width: 36.adaptSize,
              padding: EdgeInsets.all(7.h),
              decoration: IconButtonStyleHelper.fillPrimaryTL18,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup239533,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRonaldRichards(
    BuildContext context, {
    required String userName,
    required String userClockText,
  }) {
    return Row(
      children: [
        Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: AppDecoration.fillBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder20,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgRectangle568,
            height: 40.adaptSize,
            width: 40.adaptSize,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: CustomTextStyles.titleSmall15.copyWith(
                  color: appTheme.gray90001,
                ),
              ),
              SizedBox(height: 8.v),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 15.adaptSize,
                    width: 15.adaptSize,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.h,
                      bottom: 2.v,
                    ),
                    child: Text(
                      userClockText,
                      style: CustomTextStyles.bodySmall11.copyWith(
                        color: appTheme.gray50001,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildShareOne(
    BuildContext context, {
    required String share,
    required String helpfulTwo,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgShare1,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            share,
            style: CustomTextStyles.bodySmallInterGray90001.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgLike1,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 10.h),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            helpfulTwo,
            style: CustomTextStyles.bodySmallInterGray90001.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgGroup239583,
          height: 15.v,
          width: 3.h,
          margin: EdgeInsets.only(left: 10.h),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildLuxuryRhinestone(
    BuildContext context, {
    required String luxuryRhinestone,
    required String price,
    required String off,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          luxuryRhinestone,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6.v),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "99",
                      style: CustomTextStyles.titleMediumPrimary_2,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "120",
                      style: CustomTextStyles.labelLargeGray50001.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                width: 48.h,
                margin: EdgeInsets.only(left: 10.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 9.h,
                  vertical: 2.v,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Text(
                  off,
                  style:
                      CustomTextStyles.labelMediumLeagueSpartanPrimary.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
