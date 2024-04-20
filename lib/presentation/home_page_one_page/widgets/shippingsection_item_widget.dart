import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class ShippingsectionItemWidget extends StatelessWidget {
  const ShippingsectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 160.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMaskGroup,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              top: 1.v,
              bottom: 11.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.h,
              top: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Free Shipping",
                  style: CustomTextStyles.labelLargeInterSemiBold,
                ),
                SizedBox(height: 2.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Time-limited offre",
                    style: CustomTextStyles.bodySmallInter_1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
