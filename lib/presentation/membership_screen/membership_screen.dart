import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/payment_screen/payment_screen.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: 280.h,
          margin: EdgeInsets.fromLTRB(47.h, 22.v, 47.h, 5.v),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 74.h,
                  vertical: 30.v,
                ),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 9.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgCart,
                      height: 60.v,
                      width: 75.h,
                    ),
                    SizedBox(height: 23.v),
                    Text(
                      "membership",
                      style: CustomTextStyles.titleLargeWhiteA70002,
                    ),
                    SizedBox(height: 8.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "200/",
                            style: CustomTextStyles.headlineMediumWhiteA70002,
                          ),
                          TextSpan(
                            text: "Life Time",
                            style: CustomTextStyles.bodyLargeWhiteA70002,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 38.v),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemExtent: 50,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20.h,
                      right: 26.h,
                    ),
                    child: _buildLoremIpsumIsSimply(
                      context,
                      userMessage:
                          "Lorem Ipsum is simply dummy text of the printing.",
                    ),
                  );
                },
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 20.h,
              //     right: 26.h,
              //   ),
              //   child: _buildLoremIpsumIsSimply(
              //     context,
              //     userMessage:
              //         "Lorem Ipsum is simply dummy text of the printing.",
              //   ),
              // ),
              // SizedBox(height: 13.v),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 20.h,
              //     right: 26.h,
              //   ),
              //   child: _buildLoremIpsumIsSimply(
              //     context,
              //     userMessage:
              //         "Lorem Ipsum is simply dummy text of the printing.",
              //   ),
              // ),
              // SizedBox(height: 15.v),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 20.h,
              //     right: 38.h,
              //   ),
              //   child: _buildLoremIpsumIsSimply1(
              //     context,
              //     message: "Lorem Ipsum is simply dummy text.",
              //   ),
              // ),
              // SizedBox(height: 16.v),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 20.h,
              //     right: 26.h,
              //   ),
              //   child: _buildLoremIpsumIsSimply(
              //     context,
              //     userMessage:
              //         "Lorem Ipsum is simply dummy text of the printing.",
              //   ),
              // ),
              // SizedBox(height: 15.v),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 20.h,
              //     right: 38.h,
              //   ),
              //   child: _buildLoremIpsumIsSimply1(
              //     context,
              //     message: "Lorem Ipsum is simply dummy text.",
              //   ),
              // ),
              SizedBox(height: 19.v),
              CustomElevatedButton(
                onPressed: (){
                  Get.to(()=>PaymentScreen());
                },
                text: "Started",
                margin: EdgeInsets.only(
                  left: 24.h,
                  right: 26.h,
                ),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
              ),
              SizedBox(height: 5.v),
            ],
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
        text: "membership",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Common widget
  Widget _buildLoremIpsumIsSimply(
    BuildContext context, {
    required String userMessage,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgMaskGroup14x14,
          height: 14.adaptSize,
          width: 14.adaptSize,
          margin: EdgeInsets.only(
            top: 1.v,
            bottom: 22.v,
          ),
        ),
        Expanded(
          child: Container(
            width: 213.h,
            margin: EdgeInsets.only(left: 6.h),
            child: Text(
              userMessage,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumGray90001_1.copyWith(
                color: appTheme.gray90001,
                height: 1.43,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildLoremIpsumIsSimply1(
    BuildContext context, {
    required String message,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgMaskGroup14x14,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: Text(
            message,
            style: CustomTextStyles.bodyMediumGray90001_1.copyWith(
              color: appTheme.gray90001,
            ),
          ),
        ),
      ],
    );
  }
}
