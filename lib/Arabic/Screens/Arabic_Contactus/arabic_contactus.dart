import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_contactUsController.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import 'package:mohally/widgets/custom_text_form_field.dart';

class ContactUs_arabic extends StatefulWidget {
  const ContactUs_arabic({Key? key}) : super(key: key);

  @override
  State<ContactUs_arabic> createState() => _ContactUs_arabicState();
}

class _ContactUs_arabicState extends State<ContactUs_arabic> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ContactUsController _contactUsController = ContactUsController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              child: Center(
                  child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: Get.height * .3,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/customer2.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      Text(
                        "ارسل رسالة ",
                        style: CustomTextStyles.titleLargeBold,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      _buildName(context),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      _buildEmail(context),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      _buildMessage(context),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      _buildContinueButton(context),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                _buildContainer(context),
              ],
            ),
          ))),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: CustomIconButton(
            onTap: () {
              Get.back();
              // Get.offAll(TabScreen(index: 0));
            },
            height: 40.adaptSize,
            width: 40.adaptSize,
            decoration: IconButtonStyleHelper.fillGrayTL20,
            child: Center(
                child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ))),
      ),
      title: AppbarSubtitle(
        text: "اتصل بنا",
        // margin: EdgeInsets.only(left: 10),
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال الاسم';
        } else {
          return null;
        }
      },
      //controller:
      hintText: 'أدخل أسمك',
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      controller: _contactUsController.namecontroller.value,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال البريد الإلكتروني';
        } else {
          return null;
        }
      },
      //controller:
      hintText: 'أدخل بريدك الإلكتروني',
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      controller: _contactUsController.emailController.value,
    );
  }

  Widget _buildMessage(BuildContext context) {
    return CustomTextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إسقاط رسالة';
        } else {
          return null;
        }
      },
      //controller:
      hintText: 'اكتب الرسالة',
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.emailAddress,
      controller: _contactUsController.messagecontroller.value,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        loading: _contactUsController.loading.value,
        onPressed: () {
          {
            if (!_formKey.currentState!.validate()) {
              return;
            } else {
              _contactUsController.loading.value = true;
              _contactUsController.ContactUs_ApiHit(context);
              _formKey.currentState!.save();
            }
          }
        },
        text: 'أرسل رسالة',
        buttonStyle: CustomButtonStyles.fillPrimary,
      );
    });
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height * .9,
      color: Color(0xfff4f4f4),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * .03,
          ),
          Container(
            height: Get.height * .1,
            width: Get.width * .2,
            decoration:
                BoxDecoration(color: Color(0xffff8300), shape: BoxShape.circle),
            child: Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            "عنوان المكتب",
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            "3 نيوبريدج كورت ",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          Text(
            "تشينو هيلز، كاليفورنيا 91709، الولايات المتحدة",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          Container(
            height: Get.height * .1,
            width: Get.width * .2,
            decoration:
                BoxDecoration(color: Color(0xffff8300), shape: BoxShape.circle),
            child: Icon(
              Icons.email_sharp,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            "ارسل لنا عبر البريد الإلكتروني",
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            " example1@gmail.com",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          Text(
            "example2@gmail.com",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          SizedBox(
            height: Get.height * .05,
          ),
          Container(
            height: Get.height * .1,
            width: Get.width * .2,
            decoration:
                BoxDecoration(color: Color(0xffff8300), shape: BoxShape.circle),
            child: Center(
                child: Icon(Icons.help,
                    color: Colors.white,
                    size: 40)), //Image.asset('assets/images/need help.png')
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            "تحتاج مساعدة؟",
            style: CustomTextStyles.titleLargeBold,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Text(
            " يمكنك التواصل مع موهالي",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          Text(
            "خدمة العملاء للحصول على المساعدة.",
            style: CustomTextStyles.bodyLargeGray50001_3,
          ),
          SizedBox(
            height: Get.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تحتاج مساعدة",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: Color(0xffff8300)),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xffff8300),
                size: 18,
              )
            ],
          )
        ],
      ),
    );
  }
}
