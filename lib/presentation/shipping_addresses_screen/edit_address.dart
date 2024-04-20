import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/AddressViewController/address_view_controller.dart';
import 'package:mohally/view_models/controller/EditAddressController/update_address_controller.dart';
import 'package:mohally/view_models/controller/English_Remove_AddressController/remove_address_Controller_English.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class EditAddress extends StatefulWidget {
  EditAddress({Key? key})
      : super(
          key: key,
        );

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  EnglishRemoveAddressController removeAddressController =
      EnglishRemoveAddressController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EnglishUpdateaddress_controller _editAddressController =
      EnglishUpdateaddress_controller();
  Englishuseraddressviewcontroller useraddressview =
      Englishuseraddressviewcontroller();

  @override
  void initState() {
    super.initState();
    // Retrieve the passed data
    Map<String, dynamic>? addressData = Get.arguments;

    // Check if data is not null
    if (addressData != null) {
      _editAddressController.addressid.value = addressData['user_id'] ?? "";
      _editAddressController.nameEditTextController1.value.text =
          addressData['tempUserName'] ?? "";
      _editAddressController.addressEditTextController1.value.text =
          addressData['address'] ?? "";
      _editAddressController.countrycontroller.value.text =
          addressData['country'] ?? "";
      _editAddressController.cityEditTextController1.value.text =
          addressData['city'] ?? "";
      _editAddressController.group184EditTextController1.value.text =
          addressData['mobile_number'] ?? "";
      _editAddressController.californiaEditTextController1.value.text =
          addressData['state'] ?? "";
      _editAddressController.zipcodeEditTextController1.value.text =
          addressData['zip_code'] ?? "";
      _editAddressController.isAddressPrimary.value =
          addressData['primary_address_status'] == 'true';

      // Add other fields as needed
    }
  }

  bool isSelectedSwitch = true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            ' Shipping Address',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  width: Get.width * .07,
                  height: Get.height * .03,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(90, 158, 158, 158)),
                  child: Icon(
                    Icons.arrow_back,
                  )),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                        "Zip Code (Postal Code))",
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
                    _buildGroup184(context),
                    SizedBox(height: 20.v),
                    _buildSaveRow(context),
                    SizedBox(height: 30.v),
                    _buildSaveAddressButton(context),
                    SizedBox(height: 20.v),
                    _buildDeletE(context),
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
        imagePath: ImageConstant.imgArrowRightPrimary,
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
        controller: _editAddressController.nameEditTextController1.value,
        hintText: "John Due",
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Name';
          } else if (RegExp(r'[0-9]').hasMatch(value)) {
            // Check if the value contains numbers
            return ' Name should not contain numbers';
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return CustomTextFormField(
        controller: _editAddressController.addressEditTextController1.value,
        hintText: "3 Newbridge Court",
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
      controller: _editAddressController.cityEditTextController1.value,
      hintText: "Enter Your City",
      hintStyle: TextStyle(
        fontFamily: 'Almarai',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
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
      // contentPadding:
      //     EdgeInsets.only(left: 17.h, top: 17.v, bottom: 17.v, right: 10.v),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return CustomTextFormField(
      width: 160.h,
      controller: _editAddressController.countrycontroller.value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your  Country';
        }
        return null;
      },
      hintText: "Enter Your Country",
      hintStyle: TextStyle(
        fontFamily: 'Almarai',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
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
      // contentPadding:
      //     EdgeInsets.only(left: 16.h, top: 17.v, bottom: 17.v, right: 10.v),
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
        SizedBox(
          width: Get.width * .02,
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
      controller: _editAddressController.californiaEditTextController1.value,
      hintText: "California",
    );
  }

  /// Section Widget
  Widget _buildZipcodeEditText(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Zipcode';
        }
        return null;
      },
      controller: _editAddressController.zipcodeEditTextController1.value,
      hintText: "91709",
    );
  }

  /// Section Widget
  Widget _buildGroup184EditText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 3.v,
        ),
        child: CustomTextFormField(
          controller: _editAddressController.group184EditTextController1.value,
          hintText: "1453-987533",
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Your Mobile Number';
            } else if (_editAddressController
                    .group184EditTextController1.value.length !=
                10) {
              return "Phone Number Must be of Length 10 ";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
        ),
      ),
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
          value: _editAddressController.isAddressPrimary.value,
          onChanged: (value) {
            setState(() {
              _editAddressController.isAddressPrimary.value = value;
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
          _editAddressController.loading.value = true;
          _editAddressController.Updateaddress_apihit();
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

  Widget _buildDeletE(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Set the addressid to the ID you want to delete
        removeAddressController.addressid.value =
            _editAddressController.addressid.value;

        // Call the removeAddress_apiHit function
        removeAddressController.EnglishremoveAddress_apiHit();
      },
      child: Container(
          width: 300,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffff8300)),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text('Delete Address',
                style: TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          )),
    );
  }
}
