import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/Add_new_addressController/add_new_address_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
//  final RefreshController _refreshController = RefreshController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EnglishCreateaddress_controller _newAddressController =
      EnglishCreateaddress_controller();
  bool isSelectedSwitch = false;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: Get.height*0.02, left: Get.width*0.05, right: Get.width*0.05),

                // padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    _buildNameEditText(context),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Address",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    _buildAddressEditText(context),
                    SizedBox(height: 19.v),
                    _buildCityRow(context),
                    SizedBox(height: 19.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "State/Province/Region",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    _buildCaliforniaEditText(context),
                    SizedBox(height: 19.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Zip Code (Postal Code)",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    _buildZipcodeEditText(context),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mobile Number",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    _buildGroup184EditText(context),
                    SizedBox(height: 20.v),
                    _buildSaveRow(context),
                    SizedBox(height: 30.v),
                    _buildSaveAddressButton(context),
                    SizedBox(height: Get.height * .05),
                  ],
                ),
              ),
            ),
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
        text: "Shipping Address",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: _newAddressController.nameEditTextController.value,
        textInputType: TextInputType.name,
        hintText: "Enter Your Name",
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Name';
          } else if (RegExp(r'[0-9]').hasMatch(value)) {
            // Check if the value contains numbers
            return 'Name should not contain numbers';
          }

          return null;
        });
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return CustomTextFormField(
        textInputType: TextInputType.emailAddress,
        controller: _newAddressController.addressEditTextController.value,
        hintText: "Enter Your Address",
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Address';
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildCityEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your City';
        }
        return null;
      },
      controller: _newAddressController.cityEditTextController.value,
      hintText: "Enter Your City",
      // suffix: Container(
      //   margin: EdgeInsets.fromLTRB(30.h, 23.v, 17.h, 23.v),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgVectorGray900014x8,
      //     height: 4.v,
      //     width: 8.h,
      //   ),
      // ),
      // suffixConstraints: BoxConstraints(
      //   maxHeight: 50.v,
      // ),
      // contentPadding: EdgeInsets.only(
      //   left: 17.h,
      //   top: 17.v,
      //   bottom: 17.v,
      // ),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your Country';
        }
        return null;
      },
      controller: _newAddressController.countrycontroller.value,
      hintText: "Enter Your Country",
      // suffix: Container(
      //   margin: EdgeInsets.fromLTRB(30.h, 23.v, 17.h, 23.v),
      //   child: CustomImageView(
      //     imagePath: ImageConstant.imgVectorGray900014x8,
      //     height: 4.v,
      //     width: 8.h,
      //   ),
      // ),
      // suffixConstraints: BoxConstraints(
      //   maxHeight: 50.v,
      // ),
      // contentPadding: EdgeInsets.only(
      //   left: 16.h,
      //   top: 17.v,
      //   bottom: 17.v,
      // ),
    );
  }

  /// Section Widget
  Widget _buildCityRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "City",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                _buildCityEditText(context),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Country",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 7.v),
                _buildCountryEditText(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCaliforniaEditText(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your State';
        }
        return null;
      },
      controller: _newAddressController.statecontroller.value,
      hintText: "Enter State Name",
    );
  }

  /// Section Widget
  Widget _buildZipcodeEditText(BuildContext context) {
    return CustomTextFormField(
      textInputType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Zipcode';
        }
        return null;
      },
      controller: _newAddressController.zipcodeEditTextController.value,
      hintText: "91709",
    );
  }

  /// Section Widget
  Widget _buildGroup184EditText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
          cursorColor: Colors.black,
          controller: _newAddressController.group184EditTextController.value,
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Your Mobile Number';
            } else if (_newAddressController
                    .group184EditTextController.value.length !=
                10) {
              return "Phone Number Must be of Length 10 ";
            }
            return null;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: CountryCodePicker(
              padding: EdgeInsets.only(bottom: 1),
              onChanged: (element) => debugPrint(element.toLongString()),
              initialSelection: 'US',
              countryFilter: [],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              favorite: const [
                '+1',
                'US',
              ],
              showDropDownButton: true,
              showFlag: true,
            ),
            hintStyle:
                TextStyle(fontFamily: 'League Spartan', color: Colors.black),
            fillColor: appTheme.gray100,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.h),
              borderSide: BorderSide(
                color: appTheme.gray300,
                width: 1,
              ),
            ),
          )),
    );
  }

  /// Section Widget
  Widget _buildGroup184(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage11,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 3.v,
          ),
          child: Text(
            "+880",
            style: CustomTextStyles.titleMediumMedium16,
          ),
        ),
        _buildGroup184EditText(context),
      ],
    );
  }

  /// Section Widget
  Widget _buildSaveRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 6.v,
            bottom: 3.v,
          ),
          child: Text(
            "Save as primary address",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        CupertinoSwitch(
          value: _newAddressController.isAddressPrimary.value,
          onChanged: (value) {
            setState(() {
              _newAddressController.isAddressPrimary.value = value;
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSaveAddressButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          return;
        } else {
          _newAddressController.loading.value = true;
          _newAddressController.createaddress_apihit(context);
          _formKey.currentState!.save();
        }
      },
      text: "Save Address",
      margin: EdgeInsets.only(
        left: 8.h,
        right: 12.h,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }
}
