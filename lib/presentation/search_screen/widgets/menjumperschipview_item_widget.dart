import 'package:flutter/material.dart' hide SearchController;
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class MenjumperschipviewItemWidget extends StatelessWidget {
  const MenjumperschipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 7.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "men jumpers",
        style: TextStyle(
          color: appTheme.gray50001,
          fontSize: 14.fSize,
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w400,
        ),
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
