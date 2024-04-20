import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class AddNewCardScreen extends StatelessWidget {
  AddNewCardScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController mMYYYYController = TextEditingController();

  TextEditingController priceController = TextEditingController();

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
              vertical: 22.v,
            ),
            child: Column(
              children: [
                _buildVector(context),
                SizedBox(height: 27.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card Owner",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildName(context),
                SizedBox(height: 17.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Card Number",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10.v),
                _buildCardNumber(context),
                SizedBox(height: 17.v),
                _buildMmYYYY(context),
                SizedBox(height: 30.v),
                _buildAddCard(context),
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
        text: "Add New Card",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildVector(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.v,
          width: 100.h,
          padding: EdgeInsets.symmetric(
            horizontal: 36.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.outlinePrimary1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgImage9,
            height: 17.v,
            width: 26.h,
            alignment: Alignment.center,
          ),
        ),
        Container(
          height: 50.v,
          width: 100.h,
          padding: EdgeInsets.symmetric(
            horizontal: 42.h,
            vertical: 16.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgImage10,
            height: 18.v,
            width: 16.h,
            alignment: Alignment.center,
          ),
        ),
        Container(
          height: 50.v,
          width: 100.h,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 15.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgVectorGray90001,
            height: 20.adaptSize,
            width: 20.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "Enter card owner name",
    );
  }

  /// Section Widget
  Widget _buildCardNumber(BuildContext context) {
    return CustomTextFormField(
      controller: cardNumberController,
      hintText: "Enter card number",
      textInputType: TextInputType.number,
    );
  }

  /// Section Widget
  Widget _buildMMYYYY(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: mMYYYYController,
      hintText:  'MM/YYYY',
    );
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: priceController,
      hintText: 'XXX',
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildMmYYYY(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   "EXP",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 10.v),
                _buildMMYYYY(context),
              ],
            ),
          ),
        ),
        SizedBox(width: Get.width*.02,),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 7.h),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   "CVV",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 10.v),
                _buildPrice(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAddCard(BuildContext context) {
    return CustomElevatedButton(
      text: "Add Card",
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
