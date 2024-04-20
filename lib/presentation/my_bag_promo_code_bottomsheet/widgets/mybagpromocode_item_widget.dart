import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class MybagpromocodeItemWidget extends StatelessWidget {
  const MybagpromocodeItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        children: [
          Container(
            width: 80.h,
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 22.v,
            ),
            decoration: AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.v),
                  child: Text(
                    "10",
                    style: theme.textTheme.displaySmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 4.v,
                    bottom: 2.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text(
                          "%",
                          style: CustomTextStyles.bodyMediumWhiteA70002,
                        ),
                      ),
                      Text(
                        " off",
                        style: CustomTextStyles.bodyMediumWhiteA70002,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 22.v,
              bottom: 22.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal offer",
                  style: CustomTextStyles.titleSmallGray900,
                ),
                SizedBox(height: 9.v),
                Text(
                  "mypromocode2020",
                  style: CustomTextStyles.bodySmallGray900,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              right: 14.h,
              bottom: 11.v,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: Text(
                      "6 days remaining",
                      style: CustomTextStyles.bodySmallSecondaryContainer,
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                CustomElevatedButton(
                  height: 36.v,
                  width: 93.h,
                  text: "_Apply".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallMetropolisWhiteA70002,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
