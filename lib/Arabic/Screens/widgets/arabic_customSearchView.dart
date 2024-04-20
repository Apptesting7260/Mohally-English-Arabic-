import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_SearchHistory.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_SearchScreen.dart';
import 'package:mohally/core/app_export.dart';

class CustomSearchView_arabic extends StatefulWidget {
  CustomSearchView_arabic({
    Key? key,
    this.enableTap,
    this.readOnly,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  }) : super(
          key: key,
        );
  final bool? enableTap;
  final bool? readOnly;
  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  State<CustomSearchView_arabic> createState() =>
      _CustomSearchView_arabicState();
}

class _CustomSearchView_arabicState extends State<CustomSearchView_arabic> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: searchViewWidget,
          )
        : searchViewWidget;
  }

  Widget get searchViewWidget => SizedBox(
        width: Get.width * .9,

        //  width ?? double.maxFinite,
        child: TextFormField(
          onFieldSubmitted: (String value) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!.call(value);
            }
          },
          controller: widget.controller,
          focusNode: widget.focusNode ?? FocusNode(),
          autofocus: widget.autofocus!,
          style: widget.textStyle ?? CustomTextStyles.bodyLargeOnError_1,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly!,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
          validator: widget.validator,
          onChanged: (String value) {
            widget.onChanged!.call(value);
          },
          onTap: () {
            if (widget.enableTap!) {
              Get.to(ArabicSearchHistorySearchScreen());
              print('tapingggggggggggggggggggggggg');
            }
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "search",
        hintStyle: widget.hintStyle ?? CustomTextStyles.bodyLargeOnError_1,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 15),

          //  Icon(
          //   Icons.search,
          //   color: Colors.grey.shade600,
          // ),
        ),
        prefixIconConstraints: widget.prefixConstraints ??
            BoxConstraints(
              maxHeight: 50.v,
            ),
        suffixIcon: widget.suffix ??
            //  Image.asset('assets/images/greycamera.png'),
            Container(
              padding: EdgeInsets.all(15.h),
              margin: EdgeInsets.only(
                right: 30.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(
                    55.h,
                  ),
                ),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearchWhiteA70002,
                height: 30.adaptSize,
                width: 20.adaptSize,
              ),
            ),
        suffixIconConstraints: widget.suffixConstraints ??
            BoxConstraints(
              maxHeight: 60.v,
            ),
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(
              left: 16.h,
              top: 17.v,
              bottom: 17.v,
            ),
        fillColor: widget.fillColor ?? appTheme.gray100,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.gray300,
                width: 1,
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.gray300,
                width: 1,
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.gray300,
                width: 1,
              ),
            ),
      );
}
