import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class MyordersoneItemWidget_arabic extends StatelessWidget {
  const MyordersoneItemWidget_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 18.v,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order No: 194 034",
                style: CustomTextStyles.titleMediumMedium16,
              ),
              Text(
                "05-12-2019",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(
                    "عدد تتبع",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "IW3475453455",
                    style: CustomTextStyles.bodyMediumGray90001_1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "كمية",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "3",
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Spacer(),
              Text(
                "المبلغ الإجمالي",
                style: CustomTextStyles.bodyMediumGray90001_1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "199",
                  style: CustomTextStyles.titleMediumPrimary16,
                ),
              ),
            ],
          ),
          SizedBox(height: 17.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.v),
                child: Text(
                  " ألغيت",
                  style: CustomTextStyles.bodyMediumRed700,
                ),
              ),
              CustomElevatedButton(
                height: 30.v,
                width: 80.h,
                text: " تفاصيل",
                buttonStyle: CustomButtonStyles.fillPrimaryTL15,
                buttonTextStyle: CustomTextStyles.labelLargeWhiteA70002_1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
