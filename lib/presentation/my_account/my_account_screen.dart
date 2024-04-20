import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/update_profile_screen.dart';
import 'package:mohally/view_models/UodateProfile/updateProfile_controller.dart';
import 'package:mohally/view_models/controller/DeleteAccountController/delete_account_controller.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_MyAccount_text_form_field.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final DeleteAccountIns = Get.put(DeleteAccountController());
  final UpdateProfile_Controllerins = Get.put(UpdateProfile_Controller());
  final _controller = Get.put(MyAccountController());
  bool isEmail(String input) => EmailValidator.validate(input);

  // File imgFile = File("");

  // final imgPicker = ImagePicker();
  // void openCamera() async {
  //   final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       // _controller.MyAccount.value.userDetails!.imageUrl = File(pickedFile.path);
  //     }
  //   });
  //   Navigator.of(context).pop();
  // }

  // //open camera
  // void openGallery() async {
  //   final pickedFile =
  //       await ImagePicker().getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       //   _controller.MyAccount.value.userDetails!.imageUrl = File(pickedFile.path);
  //     }
  //   });
  //   Navigator.of(context).pop();
  // }

  final picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _controller.MyAccount.value.userDetails!.imageUrl =
            File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Obx(() {
            if (_controller.rxRequestStatus.value == Status.LOADING) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
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
                    "Oops! Our servers are having trouble connecting.\nPlease check your internet connection and try again",
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: Color.fromARGB(73, 0, 0, 0), fontSize: 12),
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
                                  // _controller.MyAccount.value.userDetails!
                                  //             .imageUrl ==
                                  //         null
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
                            // CustomIconButton(
                            //   height: 30.adaptSize,
                            //   width: 30.adaptSize,
                            //   padding: EdgeInsets.all(8.h),
                            //   alignment: Alignment.bottomRight,
                            //   child: CustomImageView(
                            //     onTap: () {
                            //       showDialog(
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return AlertDialog(
                            //               title: Text("Choose"),
                            //               content: Row(
                            //                 children: [
                            //                   InkWell(
                            //                     child: Text("Camera"),
                            //                     onTap: () {
                            //                       // openCamera();
                            //                       getImage(ImageSource.camera);
                            //                     },
                            //                   ),
                            //                   SizedBox(width: 80),
                            //                   InkWell(
                            //                     child: Text("Gallery"),
                            //                     onTap: () {
                            //                       getImage(ImageSource.gallery);
                            //                     },
                            //                   ),
                            //                 ],
                            //               ),
                            //             );
                            //           });
                            //     },
                            //     imagePath: ImageConstant.imgCamera1WhiteA70002,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "First Name",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 9.v),
                    _buildFirstName(context),
                    SizedBox(height: 9.v),
                    Text(
                      "Last Name",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 9.v),
                    _buildLastName(context),
                    SizedBox(height: 17.v),
                    Text(
                      "Email",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 9.v),
                    _buildEmail(context),
                    SizedBox(height: 17.v),
                    Text(
                      'Mobile Number',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 9.v),
                    MyAccountTextField(
                      hintText: _controller.MyAccount.value.userDetails!.phone
                          .toString(),
                      readOnly: true,
                    ),
                    SizedBox(height: 17.v),
                    Text(
                      'Country',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 9.v),
                    MyAccountTextField(
                      hintText: _controller.MyAccount.value.userDetails!.country
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
          })),
    );
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

  Widget _buildCountry(BuildContext context) {
    return MyAccountTextField(
      hintText: _controller.MyAccount.value.userDetails!.country.toString(),
      readOnly: true,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        DeleteAccountIns.deleteUserData();
      },
      text: "Delete Account",
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 50,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 10,
          top: 8,
          bottom: 8,
        ),
        child: CustomIconButton(
          onTap: () {
            // Get.offAll(MyProfilePage());
            Get.back();
          },
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: IconButtonStyleHelper.fillGrayTL20,
          child: CustomImageView(
            imagePath: ImageConstant.imgBack,
          ),
        ),
      ),

      // AppbarLeadingIconbuttonTwo(

      //   imagePath: ImageConstant.imgBack,
      //   margin: EdgeInsets.only(
      //     left: 10,
      //     top: 8,
      //     bottom: 8,
      //   ),
      // ),
      title: Row(
        children: [
          AppbarSubtitle(
            text: "My Account",
            margin: EdgeInsets.only(left: 16),
          ),
          SizedBox(
            width: Get.width * .3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomElevatedButton(
              height: 28.v,
              width: 56.h,
              text: "Edit",
              leftIcon: Container(
                margin: EdgeInsets.only(right: 4.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEditWhiteA70002,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                ),
              ),
              onPressed: () {
                Get.off(() => UpdateProfileScreen());
              },
              buttonTextStyle: CustomTextStyles.bodySmallWhiteA70002,
            ),
          ),
        ],
      ),
    );
  }
}
