import 'package:get/get.dart';

import '../scratch_to_win_dialog/widgets/scratchtowingrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ScratchToWinDialog extends StatelessWidget {
  const ScratchToWinDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 300.h,
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildScratchToWinGrid(context),
          SizedBox(height: 26.v),
          Text(
            "scratch_to_win".tr,
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(height: 15.v),
          Text(
            "you win 3 Scratch card ",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          SizedBox(height: 27.v),
          CustomElevatedButton(
            text: "Collect_".tr,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA70002,
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildScratchToWinGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 81.v,
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.h,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return ScratchtowingridItemWidget();
      },
    );
  }
}
