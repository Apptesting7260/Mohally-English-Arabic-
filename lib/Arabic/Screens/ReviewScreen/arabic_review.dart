// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Myprofile/my_profile_arabic.dart';
import 'package:mohally/Arabic/Screens/ReviewScreen/arabic_add_review.dart';
import 'package:mohally/presentation/add_review_screen/add_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/reviews_screen/widgets/photos_item_widget.dart';
import 'package:mohally/presentation/reviews_screen/widgets/photoslist_item_widget.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

class ReviewsScreen_arabic extends StatelessWidget {
  const ReviewsScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "مراجعات العناصر",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width * .07,
                  height: Get.height * .03,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(90, 158, 158, 158)),
                  child: Icon(
                    Icons.arrow_back,
                  )),
            ),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 19.v),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAddReviewRow(context),
                      SizedBox(height: 25.v),
                      _buildRonaldRichards(
                        context,
                        userName: "رونالد ريتشاردز",
                        userClockText: "13 Sep, 2020",
                      ),
                      SizedBox(height: 20.v),
                      CustomRatingBar(
                        initialRating: 3,
                        itemSize: 14,
                      ),
                      SizedBox(height: 8.v),
                      Text("الشراء : أسود/كبير(40)\nالإجمالي: صحيح في الحجم",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                      SizedBox(height: 4.v),
                      Container(
                        width: 322.h,
                        // margin: EdgeInsets.only(right: 10.h),
                        child: Text(
                          'لوريم إبسوم هو طباعة ببساطة نص وهمي من صناعة والتنضيف. لقد كان لوريم إيبسوم هو النص الوهمي الكلاسيكي في هذه الصناعة منذ القرن السادس عشر.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarai',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      _buildPhotosList(context),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: _buildShareOne(
                          context,
                          userShareLabel: "يشارك",
                          userHelpfulLabel: "مفيد (2)",
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 20.v),
                      _buildRonaldRichards(
                        context,
                        userName: "رونالد ريتشاردز",
                        userClockText: "13 سبتمبر 2020",
                      ),
                      SizedBox(height: 20.v),
                      CustomRatingBar(
                        initialRating: 3,
                        itemSize: 14,
                      ),
                      SizedBox(height: 8.v),
                      Text("الشراء : أسود/كبير(40)\nالإجمالي: صحيح في الحجم",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                      SizedBox(height: 4.v),
                      Container(
                        width: 322.h,
                        // margin: EdgeInsets.only(right: 13.h),
                        child: Text(
                          'لوريم إبسوم هو طباعة ببساطة نص وهمي من صناعة والتنضيف. لقد كان لوريم إيبسوم هو النص الوهمي الكلاسيكي في هذه الصناعة منذ القرن السادس عشر.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarai',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      _buildPhotosList(context),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: _buildShareOne(
                          context,
                          userShareLabel: "يشارك",
                          userHelpfulLabel: "مفيد (2)",
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(height: 20.v),
                      _buildRonaldRichards(
                        context,
                        userName: "رونالد ريتشاردز",
                        userClockText: "13 Sep, 2020",
                      ),
                      SizedBox(height: 20.v),
                      CustomRatingBar(
                        initialRating: 3,
                        itemSize: 14,
                      ),
                      SizedBox(height: 8.v),
                      Text("الشراء : أسود/كبير(40)\nالإجمالي: صحيح في الحجم",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Almarai',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey)),
                      SizedBox(height: 4.v),
                      Container(
                        width: 322.h,
                        // margin: EdgeInsets.only(right: 10.h),
                        child: Text(
                          'لوريم إبسوم هو طباعة ببساطة نص وهمي من صناعة والتنضيف. لقد كان لوريم إيبسوم هو النص الوهمي الكلاسيكي في هذه الصناعة منذ القرن السادس عشر.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Almarai',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      _buildPhotosList(context),
                      SizedBox(height: 20.v),
                      Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: _buildShareOne(
                          context,
                          userShareLabel: "يشارك",
                          userHelpfulLabel: "مفيد (2)",
                        ),
                      ),
                      SizedBox(height: 20.v),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildAddReviewRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "4.8",
                  style: CustomTextStyles.titleMediumInter,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.h,
                    top: 2.v,
                    bottom: 2.v,
                  ),
                  child: CustomRatingBar(
                    initialRating: 4,
                    itemSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.v),
          ],
        ),
        CustomElevatedButton(
          onPressed: () {
            Get.to(() => AddReviewScreen_arabic());
          },
          height: 35.v,
          width: 114.h,
          text: "إضافة مراجعة",
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 7.v,
          ),
          leftIcon: Container(
            margin: EdgeInsets.only(right: 5.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgEditSquare,
              height: 15.adaptSize,
              width: 15.adaptSize,
            ),
          ),
          buttonTextStyle: CustomTextStyles.labelLargeWhiteA70001,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPhotosList(BuildContext context) {
    return SizedBox(
      height: 100.v,
      child: ListView.separated(
        // padding: EdgeInsets.only(right: 20.h),
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
          return PhotoslistItemWidget();
        },
      ),
    );
  }

  /// Section Widget

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
              Text(userName,
                  style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
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
                    child: Text(userClockText,
                        style: TextStyle(
                            fontFamily: 'Almarai',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
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
    required String userShareLabel,
    required String userHelpfulLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(userShareLabel,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Almarai',
                  color: Colors.black)),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgShare1,
          height: 16.adaptSize,
          width: 16.adaptSize,
        ),
        SizedBox(
          width: Get.width * .02,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(userHelpfulLabel,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Almarai',
                  color: Colors.black)),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgLike1,
          height: 16.adaptSize,
          width: 16.adaptSize,
          margin: EdgeInsets.only(left: 10.h),
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
}
