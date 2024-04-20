import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class WishlistgridItemWidget extends StatelessWidget {
  const WishlistgridItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160.adaptSize,
          width: 160.adaptSize,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle569,
                height: 160.adaptSize,
                width: 160.adaptSize,
                radius: BorderRadius.circular(
                  10.h,
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.v,
                  right: 10.h,
                ),
                child: CustomIconButton(
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.fillWhiteA,
                  alignment: Alignment.topRight,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup239531,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.v),
        CustomElevatedButton(
          height: 16.v,
          width: 48.h,
          text: "10% Off",
          buttonTextStyle:
              theme.textTheme.labelSmall!.copyWith(color: Colors.white),
        ),
        SizedBox(height: 5.v),
        SizedBox(
          width: 131.h,
          child: Text(
            "Luxury Rhinestone Quartz Watch Ladies Rome...",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelLarge!.copyWith(
              height: 1.33,
            ),
          ),
        ),
        SizedBox(height: 3.v),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "4.8",
                        style: theme.textTheme.labelMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: CustomRatingBar(
                          ignoreGestures: true,
                          initialRating: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "99 ",
                        style: CustomTextStyles.titleMediumPrimary_2,
                      ),
                      TextSpan(
                        text: "2k+ sold",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 58.h,
                top: 3.v,
                bottom: 2.v,
              ),
              child: CustomIconButton(
                height: 30.adaptSize,
                width: 30.adaptSize,
                padding: EdgeInsets.all(6.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup239533,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
