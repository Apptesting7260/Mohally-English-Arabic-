import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
// ignore: must_be_immutable
class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
                alignment: alignment ?? Alignment.center,
                child: switchWidget,
              )
            : switchWidget);
  }

  Widget get switchWidget => CupertinoSwitch(
        value: value ?? false,
         trackColor: (value ?? false) ? appTheme.green40001 : appTheme.gray90033, // Change color based on the state
        thumbColor:
            (value ?? false) ? appTheme.whiteA70001 : appTheme.whiteA70001,
        activeColor: appTheme.green40001,
        onChanged: (value) {
          onChange(value);
        },
      );
}
