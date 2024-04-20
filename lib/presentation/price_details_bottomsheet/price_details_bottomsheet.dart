import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_radio_button.dart';

// ignore_for_file: must_be_immutable
class PriceDetailsBottomsheet extends StatelessWidget {
  PriceDetailsBottomsheet({Key? key})
      : super(
          key: key,
        );

  String radioGroup = "";

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*.4,
      padding: EdgeInsets.symmetric(vertical: 18.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  child: Text(
                    "Price_Details".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgMaskGroup24x24,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 17.v),
          Opacity(
            opacity: 0.15,
            child: Divider(
              color: appTheme.gray90001.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 19.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Cart (1)",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 14.v),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle56980x80,
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 20.h),
          ),
          SizedBox(height: 7.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "99",
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "x 1",
                      style: CustomTextStyles.bodyMediumPrimary_1,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 26.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildItemDiscount(
              context,
              itemDiscountText: "Item_total".tr,
              priceText: "198",
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildItemDiscount(
              context,
              itemDiscountText: "Item_discount".tr,
              priceText: "20",
            ),
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: _buildItemDiscount(
              context,
              itemDiscountText: "Total_".tr,
              priceText: "218",
            ),
          ),
          SizedBox(height: 27.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: CustomRadioButton(
                    text: "All_".tr,
                    value: "All",
                    groupValue: radioGroup,
                    padding: EdgeInsets.symmetric(vertical: 1.v),
                    textStyle: CustomTextStyles.bodyLarge18,
                    onChange: (value) {
                      radioGroup = value;
                    },
                  ),
                ),
                Container(
                  height: 40.v,
                  width: 130.h,
                  margin: EdgeInsets.only(left: 23.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 27.h,
                            top: 12.v,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Total_".tr,
                                  style: CustomTextStyles.bodyMediumGray90001,
                                ),
                                TextSpan(
                                  text: " 218",
                                  style: CustomTextStyles.titleSmallSemiBold,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 40.v,
                          width: 130.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 26.h,
                            vertical: 16.v,
                          ),
                          decoration:
                              AppDecoration.outlineErrorContainer.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder20,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVectorGray900013x6,
                            height: 5.v,
                            width: 10.h,
                            alignment: Alignment.topRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  height: 40.v,
                  width: 130.h,
                  text: "Checkout_".tr,
                  margin: EdgeInsets.only(left: 10.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                  buttonTextStyle: CustomTextStyles.titleMediumWhiteA70016,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildItemDiscount(
    BuildContext context, {
    required String itemDiscountText,
    required String priceText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemDiscountText,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.gray90001,
          ),
        ),
        Text(
          priceText,
          style: CustomTextStyles.titleMediumMedium16.copyWith(
            color: appTheme.gray90001,
          ),
        ),
      ],
    );
  }
}
