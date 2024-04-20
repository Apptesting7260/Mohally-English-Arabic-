import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_create_password_Controller.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';

class CreatePassword_arabic extends StatefulWidget {
  const CreatePassword_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<CreatePassword_arabic> createState() => _CreatePassword_arabicState();
}

class _CreatePassword_arabicState extends State<CreatePassword_arabic> {
  arabic_Createpass_controller arabic_createpass_controller =
      Get.put(arabic_Createpass_controller());

  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    arabic_createpass_controller.loading.value = true;
    arabic_createpass_controller.arabic_Createpass_apihit(context);
    _formKey.currentState!.save();
  }

  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  @override
  void initState() {
    arabic_createpass_controller.passwordController.value.clear();
    arabic_createpass_controller.confirmpasswordController.value.clear();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
            ),
          )),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),
                Center(
                  child: Text("إنشاء كلمة المرور",
                      style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                ),
                SizedBox(height: height * 0.001),
                Center(
                  child: Text('الرجاء إنشاء كلمة مرور جديدة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Color(0xff9796A1),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      )),
                ),
                SizedBox(height: height * 0.05),
                Text("كلمة المرور الجديدة",
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller:
                      arabic_createpass_controller.passwordController.value,
                  //passwordController,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: " أدخل كلمة المرور".tr,
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                fontFamily: 'Almarai',
                                color: Color(0xff9796A1),
                                fontWeight: FontWeight.w300,
                              ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xffD0D2D1),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1)))),
                  onFieldSubmitted: (value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'أدخل كلمة المرور الصالحة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.02),
                Text("تأكيد كلمة المرور",
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: arabic_createpass_controller
                      .confirmpasswordController.value,
                  obscureText: confirmpasswordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "تأكيد كلمة المرور",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                fontFamily: 'Almarai',
                                color: Color(0xff9796A1),
                                fontWeight: FontWeight.w300,
                              ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmpasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xffD0D2D1),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              confirmpasswordVisible = !confirmpasswordVisible;
                            },
                          );
                        },
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff9796A1)))),
                  onFieldSubmitted: (value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'أدخل تأكيد كلمة المرور الصالحة';
                    }
                    if (arabic_createpass_controller
                            .passwordController.value.text !=
                        arabic_createpass_controller
                            .confirmpasswordController.value.text) {
                      return 'كلمة السر غير مطابقة';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.05),
                Center(
                  child: Obx(() {
                    return CustomElevatedButton(
                        loading: arabic_createpass_controller.loading.value,
                        text: 'يكمل'.tr,
                        buttonTextStyle: TextStyle(
                            fontFamily: 'Almarai',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _submit();
                          }
                        },
                        height: height * .07,
                        width: width * 0.5);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
