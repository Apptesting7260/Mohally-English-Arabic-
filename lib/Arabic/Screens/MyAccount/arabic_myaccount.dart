// ignore_for_file: unused_import
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/Arabic/Screens/MyAccount/EditMyaccount/arabic_editAccount.dart';
import 'package:mohally/Arabic/Screens/MyAccount/EditMyaccount/arabic_editAccount.dart';
import 'package:mohally/Arabic/Screens/MyAccount/EditMyaccount/arabic_editAccount.dart';
import 'package:mohally/Arabic/Screens/Myprofile/my_profile_arabic.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/app_exceptions.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/update_profile_screen.dart';
import 'package:mohally/view_models/UodateProfile/updateProfile_controller.dart';
import 'package:mohally/view_models/controller/DeleteAccountController/delete_account_controller.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_MyAccount_text_form_field.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class MyAccountScreen_arabic extends StatefulWidget {
  const MyAccountScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyAccountScreen_arabic> createState() => _MyAccountScreen_arabicState();
}

class _MyAccountScreen_arabicState extends State<MyAccountScreen_arabic> {
  final DeleteAccountIns = Get.put(DeleteAccountController());
  final UpdateProfile_Controllerins = Get.put(UpdateProfile_Controller());
  final _controller = Get.put(MyAccountController());
  bool isEmail(String input) => EmailValidator.validate(input);

  File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    setInitialLocale();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.fetchMyAccountData();
    });
    super.initState();
  }

  void setInitialLocale() {
    if (Get.locale == null || Get.locale?.languageCode == 'ar') {
      Get.updateLocale(Locale('ar', 'DZ'));
    } else {
      Get.updateLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Obx(() {
              if (_controller.rxRequestStatus.value == Status.LOADING) {
                return Center(child: CircularProgressIndicator());
              } else if (_controller.rxRequestStatus.value == Status.ERROR) {
                return Scaffold(
                    body: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/error2.png',
                    ),
                    Text(
                      "عفوا! تواجه خوادمنا مشكلة في الاتصال.\nيرجى التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى",
                      style: theme.textTheme.headlineMedium?.copyWith(
                          color: Color.fromARGB(73, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Almarai'),
                    ),
                  ],
                )));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 33),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 120.adaptSize,
                          width: 120.adaptSize,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: height * .2,
                                width: width * .3,
                                child: _controller.MyAccount.value.userDetails!
                                            .imageUrl ==
                                        null
                                    ? CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                                        backgroundColor: Colors.transparent,
                                      )
                                    : CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage:
                                            // FileImage(_controller
                                            //     .MyAccount
                                            //     .value
                                            //     .userDetails!
                                            //     .imageUrl),

                                            NetworkImage(_controller.MyAccount
                                                .value.userDetails?.imageUrl),
                                        backgroundColor: Colors.transparent,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الاسم الأول",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildFirstName(context),
                      SizedBox(height: 9.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "اسم العائلة",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildLastName(context),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "بريد إلكتروني",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildEmail(context),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'رقم الهاتف المحمول',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      MyAccountTextField(
                        hintText: _controller.MyAccount.value.userDetails!.phone
                            .toString(),
                        readOnly: true,
                      ),
                      SizedBox(height: 17.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'دولة',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontFamily: 'Almarai'),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      MyAccountTextField(
                        hintText: _controller
                            .MyAccount.value.userDetails!.country
                            .toString(),
                        readOnly: true,
                      ),
                      SizedBox(height: 30.v),
                      _buildContinueButton(context),
                      SizedBox(height: 109.v),
                    ],
                  ),
                );
              }
            }),
          ),
        ));
  }

  Widget _buildFirstName(BuildContext context) {
    return MyAccountTextField(
      hintText: _controller.MyAccount.value.userDetails!.firstName.toString(),
      readOnly: true,
    );
  }

  Widget _buildLastName(BuildContext context) {
    return MyAccountTextField(
      hintText: _controller.MyAccount.value.userDetails!.lastName.toString(),
      readOnly: true,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return MyAccountTextField(
      hintText: _controller.MyAccount.value.userDetails!.email.toString(),
      readOnly: true,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        DeleteAccountIns.deleteUserData();
      },
      text: "حذف الحساب",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          AppbarSubtitle(
            text: "حسابي",
            margin: EdgeInsets.only(left: 16),
          ),
          SizedBox(
            width: Get.width * .4,
          ),
          CustomElevatedButton(
            onPressed: () {
              Get.off(() => UpdateProfileScreen_arabic());
            },
            height: 28.v,
            width: 56.h,
            text: "يحرر",
            leftIcon: Container(
              margin: EdgeInsets.only(right: 4.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgEditWhiteA70002,
                height: 12.adaptSize,
                width: 12.adaptSize,
              ),
            ),
            buttonTextStyle: CustomTextStyles.bodySmallWhiteA70002,
          ),
        ],
      ),
      leading: CustomIconButton(
          onTap: () {},
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: IconButtonStyleHelper.fillGrayTL20,
          child: Center(
              child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ))),
    );
  }
}
