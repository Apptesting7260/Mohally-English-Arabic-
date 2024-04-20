import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/view_models/controller/create_password_controller/create_password_controller.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:pinput/pinput.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key})
      : super(
          key: key,
        );

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  Createpass_controller createpass_controller =
      Get.put(Createpass_controller());

  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createpass_controller.loading.value=true;
    createpass_controller.Createpass_apihit(context);
    _formKey.currentState!.save();
  }

  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  @override
  void initState() {
    createpass_controller.passwordController.value.clear();
    createpass_controller.confirmpasswordController.value.clear();
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
                  child: Text(
                   "Create Password",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(height: height * 0.001),
                Center(
                  child: Text(
                    'Please create a New password',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Text(
                 "New Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: createpass_controller.passwordController.value,
                  //passwordController,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: " Enter Password",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
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
                      return 'enter the valid password';
                    }  else if(createpass_controller.passwordController.value.length<6){
          return 'The password must be at least 6 characters. ';
        }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.02),
                Text(
                 "Confirm Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller:
                      createpass_controller.confirmpasswordController.value,
                  obscureText: confirmpasswordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:"Confirm Password",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
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
                      return'enter the confirm valid password';
                    }
                    if (createpass_controller.passwordController.value.text !=
                        createpass_controller
                            .confirmpasswordController.value.text) {
                      return 'password do not match';
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
                      loading: createpass_controller.loading.value ,
                        text: 'Continue'.tr,
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) 
                          {
                            _formKey.currentState!.save();
                            _submit();
                          }
                        },
                        height: height * .07,
                        width: width * 0.5
                        );
                  }

                  
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
