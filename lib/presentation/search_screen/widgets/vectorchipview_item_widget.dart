import 'package:flutter/material.dart' hide SearchController;
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class VectorchipviewItemWidget extends StatelessWidget {
  const VectorchipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(
        top: 7.v,
        right: 13.h,
        bottom: 7.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Men watch",
        style: TextStyle(
          color: appTheme.gray50001,
          fontSize: 14.fSize,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgVector,
        height: 10.v,
        width: 8.h,
        margin: EdgeInsets.only(right: 4.h),
      ),
      selected: false,
      backgroundColor: appTheme.gray100,
      selectedColor: appTheme.gray100,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          14.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
