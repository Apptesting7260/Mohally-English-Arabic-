import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class RecommendedsectionItemWidget extends StatelessWidget {
  const RecommendedsectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Text(
          "_Recommended".tr,
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}
