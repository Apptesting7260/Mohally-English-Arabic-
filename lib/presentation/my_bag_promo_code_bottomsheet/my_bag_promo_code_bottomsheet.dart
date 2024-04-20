import 'package:get/get.dart';

import '../my_bag_promo_code_bottomsheet/widgets/mybagpromocode_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MyBagPromoCodeBottomsheet extends StatelessWidget {
  const MyBagPromoCodeBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return _buildPromoCodeList(context);
  }

  /// Section Widget
  Widget _buildPromoCodeList(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.v),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.v),
                    child: Text(
                      "promo_code".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgMaskGroup24x24,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.v),
            Opacity(
              opacity: 0.15,
              child: Divider(
                color: appTheme.gray90001.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 30.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.h),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return SizedBox(
                    height: 14.v,
                  );
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return MybagpromocodeItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
