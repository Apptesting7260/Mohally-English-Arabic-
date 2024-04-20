import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class SpinTheWheelDialog extends StatelessWidget {
  const SpinTheWheelDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 300.h,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup239626,
            height: 175.v,
            width: 200.h,
          ),
          SizedBox(height: 35.v),
          Text(
            "You Win 0.7",
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(height: 17.v),
          CustomElevatedButton(
            text: "Collect_".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }
}
