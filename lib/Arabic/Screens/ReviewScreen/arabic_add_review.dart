// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mohally/Arabic/Screens/ReviewScreen/arabic_review.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_outlined_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddReviewScreen_arabic extends StatelessWidget {
  AddReviewScreen_arabic({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController groupEditTextController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 19.v,
            ),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اسم",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Almarai'),
                ),
                SizedBox(height: 9.v),
                _buildNameEditText(context),
                SizedBox(height: 19.v),
                Text(
                  "كيف كانت تجربتك؟",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Almarai'),
                ),
                SizedBox(height: 7.v),
                _buildGroupEditText(context),
                SizedBox(height: 19.v),
                Text(
                  "اوصف تجربتك ..",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Almarai'),
                ),
                SizedBox(height: 7.v),
                CustomRatingBar(
                  initialRating: 0,
                  itemSize: 50,
                ),
                SizedBox(height: 30.v),
                _buildAddPhotosVideoButton(context),
                SizedBox(height: 15.v),
                _buildSubmitReviewButton(context),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: AppbarSubtitle(
        text: " إضافة مراجعة",
        margin: EdgeInsets.only(left: 16),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: GestureDetector(
          onTap: () {
            Get.offAll(ReviewsScreen_arabic());
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
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
      controller: nameEditTextController,
      hintText: 'أدخل أسمك',
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: 'Almarai',
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineGray,
    );
  }

  /// Section Widget
  Widget _buildGroupEditText(BuildContext context) {
    return CustomTextFormField(
      controller: groupEditTextController,
      hintText: " اوصف تجربتك ..",
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: 'Almarai',
      ),
      textInputAction: TextInputAction.done,
      maxLines: 12,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 22.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildAddPhotosVideoButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "إضافة صور / فيديو",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 9.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgBaselinephotocamera24px,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.outlineOnPrimaryContainer,
      buttonTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0XFF8F959E),
          fontFamily: 'Almarai'),
      alignment: Alignment.center,
      onPressed: () {
        _showAddMediaBottomSheet(context);
      },
    );
  }

  /// Section Widget
  Widget _buildSubmitReviewButton(BuildContext context) {
    return CustomElevatedButton(
      text: "إرسال المراجعة",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: 'Almarai'),
      alignment: Alignment.center,
    );
  }

  void _showAddMediaBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Get.height * .3,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: Get.height * .06,
                  width: Get.width * .07,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffff8300),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/blackcamera.png'),
                      SizedBox(
                        width: Get.width * .01,
                      ),
                      Text(
                        'تصوير',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Almarai',
                            color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/blackvideo.png'),
                      SizedBox(
                        width: Get.width * .01,
                      ),
                      Text(
                        'اختر من الألبوم',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Almarai',
                            color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Text(
                    'يلغي',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Almarai',
                        color: Color(0xffff8300)),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
