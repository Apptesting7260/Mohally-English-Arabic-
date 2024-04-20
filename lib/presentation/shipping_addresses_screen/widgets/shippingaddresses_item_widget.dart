import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class ShippingaddressesItemWidget extends StatefulWidget {
  const ShippingaddressesItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  State<ShippingaddressesItemWidget> createState() =>
      _ShippingaddressesItemWidgetState();
}

class _ShippingaddressesItemWidgetState
    extends State<ShippingaddressesItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Expanded(
          child: ListView.builder(
            itemExtent: 180,
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.all(10.h),
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 9.v,
                              bottom: 1.v,
                            ),
                            child: Text(
                              "Jane Doe",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          CustomElevatedButton(
                            height: 28.v,
                            width: 56.h,
                            text: "Edit",
                            leftIcon: Container(
                              margin: EdgeInsets.only(right: 4.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgEditWhiteA70002,
                                height: 12.adaptSize,
                                width: 12.adaptSize,
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.bodySmallWhiteA70002,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Container(
                      width: 239.h,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        right: 66.h,
                      ),
                      child: Text(
                        "3 Newbridge Court \r\nChino Hills, CA 91709, United States",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeGray50001_3.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.v),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Row(
                        children: [
                          Container(
                            height: 18.adaptSize,
                            width: 18.adaptSize,
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.h,
                              vertical: 5.v,
                            ),
                            decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgVectorWhiteA70002,
                              height: 7.v,
                              width: 9.h,
                              radius: BorderRadius.circular(
                                1.h,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6.h,
                              top: 3.v,
                            ),
                            child: Text(
                              "Use as the shipping address",
                              style: CustomTextStyles.bodyMediumGray90001_1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingIconbuttonTwo(
        onTap: () {
          Get.back();
        },
        imagePath: ImageConstant.imgBack,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 8.v,
          bottom: 8.v,
        ),
      ),
      title: AppbarSubtitle(
        text: "Shipping Addresses",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }
}
