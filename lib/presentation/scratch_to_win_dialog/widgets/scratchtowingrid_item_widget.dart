import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class ScratchtowingridItemWidget extends StatelessWidget {
  const ScratchtowingridItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.adaptSize,
      width: 80.adaptSize,
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: CustomImageView(
        imagePath: ImageConstant.imgRectangle3463416,
        height: 80.adaptSize,
        width: 80.adaptSize,
        radius: BorderRadius.circular(
          10.h,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
