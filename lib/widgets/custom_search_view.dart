import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/presentation/search_screen/search_screen.dart';
import 'package:mohally/presentation/search_screen/widgets/SearchHistoryScreen.dart';

class CustomSearchView extends StatefulWidget {
  CustomSearchView({
    Key? key,
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
    this.enableTap,
    this.readOnly,
    this.onFieldSubmitted,
  }) : super(
          key: key,
        );
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
  final bool? enableTap;
  final Function(String)? onFieldSubmitted;

  @override
  State<CustomSearchView> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView> {
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
          controller: widget.controller,
          focusNode: widget.focusNode ?? FocusNode(),
          autofocus: widget.autofocus!,
          style: widget.textStyle ?? CustomTextStyles.bodyLargeOnError_1,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly!,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
          validator: widget.validator,
          onFieldSubmitted: (String value) {
            if (widget.onFieldSubmitted != null) {
              widget.onFieldSubmitted!.call(value);
            }
          },
          onChanged: (String value) {
            widget.onChanged!.call(value);
          },
          onTap: () {
            if (widget.enableTap!) {
              Get.to(SearchHistoryScreen());
              print('tapingggggggggggggggggggggggg');
            }
          },
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ?? CustomTextStyles.bodyLargeOnError_1,
        // prefixIcon: Padding(
        //   padding: EdgeInsets.all(
        //     15.h,
        //   ),
        //   child: Icon(
        //     Icons.search,
        //     color: Colors.grey.shade600,
        //   ),
        // ),
        prefixIconConstraints: widget.prefixConstraints ??
            BoxConstraints(
              maxHeight: 50.v,
            ),
        suffixIcon: widget.suffix ??
            Container(
              padding: EdgeInsets.all(15.h),
              margin: EdgeInsets.only(
                left: 30.h,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
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
