import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';

// ignore: must_be_immutable
class ListrecommendedItemWidget extends StatelessWidget {
  const ListrecommendedItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text(
            "Recommended",
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
