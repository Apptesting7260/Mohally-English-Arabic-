import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_add_new_address_Controller.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_address.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class add_new_Address_arabic extends StatefulWidget {
  add_new_Address_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<add_new_Address_arabic> createState() => _add_new_Address_arabicState();
}

class _add_new_Address_arabicState extends State<add_new_Address_arabic> {
  List<String> cities = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Ahmedabad',
    'Pune',
    'Jaipur',
    'Lucknow',
  ];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color textFieldColor = Colors.grey;
  Createaddress_controller _newAddressController = Createaddress_controller();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'إضافة عنوان جديد',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.offAll(() => addresses_arabic());
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
            child: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 19.v),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "اسم",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildNameEditText(context),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "عنوان",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildAddressEditText(context),
                      SizedBox(height: 19.v),
                      _buildCityRow(context),
                      SizedBox(height: 19.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الدولة / الإقليم / المنطقة",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      _buildCaliforniaEditText(context),
                      SizedBox(height: 19.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الرمز البريدي / الرمز البريدي)",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      _buildZipcodeEditText(context),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "رقم الهاتف المحمول",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      // _buildGroup184(context),
                      SizedBox(height: 9.v),
                      _mobilenumberfield(context),
                      // _buildSaveRow(context),
                      SizedBox(height: 30.v),
                      _buildSaveAddressButton(context),
                      SizedBox(height: 20.v),
                    ],
                  ),
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
        text: "عنوان الشحن",
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
      textInputType: TextInputType.name,
      width: 160.h,
      controller: _newAddressController.cityEditTextController.value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter Your City';
        }
        return null;
      },
      hintText: "Enter City Name",
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
      contentPadding:
          EdgeInsets.only(left: 17.h, top: 17.v, bottom: 17.v, right: 10.v),
    );
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      height: Get.height * .08,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: _newAddressController.countrycontroller.value,
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Select Country';
          }
          return null;
        },
        showCursor: false,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: CountryCodePicker(
            padding: EdgeInsets.only(bottom: 1),
            onChanged: (CountryCode countryCode) {
              // Set the selected country to the controller
              _newAddressController.countrycontroller.value.text =
                  countryCode.name.toString();
            },
            initialSelection: 'US',
            countryFilter: [],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            textStyle: TextStyle(
              color: Color(0xFF272727),
              fontSize: 14,
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
            ),
            alignLeft: true,
            searchDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            searchStyle: TextStyle(color: appTheme.orange400),
            showFlagDialog: true,
            showDropDownButton: true,
            showFlag: false,
          ),
          hintStyle: TextStyle(
            fontFamily: 'League Spartan',
            color: Colors.black,
          ),
          fillColor: appTheme.gray100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: theme.colorScheme.onPrimaryContainer,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: theme.colorScheme.onPrimaryContainer,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: appTheme.gray300,
              width: 1,
            ),
          ),
        ),
      ),
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
                  "مدينة",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Almarai'),
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
                  "دولة",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontFamily: 'Almarai'),
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
  Widget _mobilenumberfield(BuildContext context) {
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
  // Widget _buildSaveRow(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(
  //           top: 6.v,
  //           bottom: 3.v,
  //         ),
  //         child: Text(
  //           "حفظ كعنوان أساسي",
  //           style: theme.textTheme.bodyLarge?.copyWith(fontFamily: 'Almarai'),
  //         ),
  //       ),
  //      Switch(
  //       activeColor:Colors.green,
  //       inactiveTrackColor:Colors.grey,
  //               value:_newAddressController.isAddressPrimary.value,
  //               onChanged: (value) {
  //                 print("Switch===value===${_newAddressController.isAddressPrimary.value}");
  //                _newAddressController.toggleAddressStatus();
  //               },
  //             ),
  //     ],
  //   );
  // }

  /// Section Widget
  Widget _buildSaveAddressButton(BuildContext context) {
    return Obx(() {
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
        loading: _newAddressController.loading.value,
        text: "يُقدِّم",
        margin: EdgeInsets.only(
          left: 8.h,
          right: 12.h,
        ),
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
  }
}
