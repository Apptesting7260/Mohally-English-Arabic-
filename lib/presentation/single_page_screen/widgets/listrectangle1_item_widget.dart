import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class Listrectangle1ItemWidget extends StatelessWidget {
  const Listrectangle1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.adaptSize,
      width: 80.adaptSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle57680x80,
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle5691,
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              5.h,
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
