import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/Arabic/Arabic_controllers/arabic_edit_address_controller.dart';
import 'package:mohally/Arabic/Arabic_controllers/user_Address_view_Controller.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_add_new_address.dart';
import 'package:mohally/Arabic/Screens/Address/arabic_edit_address.dart';
import 'package:mohally/Arabic/Screens/Arabic_HomeScreen/arabic_tabbar.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/data/response/status.dart';
// import 'package:mohally/presentation/tab_screen/tab_bar.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

String? arabicaddressId;
RxString arabicaddressname = "".obs;
String? arabicaddressIndexId;

// ignore: must_be_immutable
class addresses_arabic extends StatefulWidget {
  const addresses_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<addresses_arabic> createState() => _addresses_arabicState();
}

class _addresses_arabicState extends State<addresses_arabic> {
  List<bool> isSelectedList = List.generate(10, (index) => false);

  @override
  void initState() {
    super.initState();
    useraddressview.UseraddressView_apihit();
  }

  useraddressviewcontroller useraddressview = useraddressviewcontroller();
  Updateaddress_controller Updateaddress_controllerin =
      Updateaddress_controller();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (useraddressview.rxRequestStatus.value == Status.LOADING) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
            appBar: CustomAppBar(
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
                text: "عنوان",
                // margin: EdgeInsets.only(left: 10),
              ),
            ),
            body: useraddressview.userList.value.userAddress == null ||
                    useraddressview.userList.value.userAddress?.length == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/emptyaddress.png'),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Text(
                        'لم تتم إضافة عنوان بعد!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Almarai'),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Text(
                        'انقر فوق الزر "إضافة عنوان جديد" أدناه\n لإضافة عنوان الشحن الأول الخاص بك',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'Almarai'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      _buildSaveAddressButton(context),
                    ],
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        // Default_address_view_arabic(),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: useraddressview
                                    .userList.value.userAddress!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10.0),
                                    padding: EdgeInsets.all(10.h),
                                    decoration: AppDecoration.fillGray.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder15,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 9.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 9.v,
                                                  bottom: 1.v,
                                                ),
                                                child: Text(
                                                  "${useraddressview.userList.value.userAddress?[index].tempUserName}",
                                                  style: theme
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          fontFamily:
                                                              'Almarai'),
                                                ),
                                              ),
                                              CustomElevatedButton(
                                                height: 28.v,
                                                width: 56.h,
                                                text: "يحرر",
                                                //     onPressed: (){

                                                //    Updateaddress_controllerin.addressid.value= useraddressview.userList.value.userAddress![index].id.toString();
                                                //      Get.to(EditAddress_arabic());

                                                // print(Updateaddress_controllerin.addressid.value);
                                                //     },
                                                onPressed: () async {
                                                  var result = await Get.off(
                                                      EditAddress_arabic(),
                                                      arguments: {
                                                        'user_id':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .id
                                                                .toString(),
                                                        'tempUserName':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .tempUserName,
                                                        'address':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .address,
                                                        'country':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .country,
                                                        'city': useraddressview
                                                            .userList
                                                            .value
                                                            .userAddress![index]
                                                            .city,
                                                        'state': useraddressview
                                                            .userList
                                                            .value
                                                            .userAddress![index]
                                                            .state,
                                                        'zip_code':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .zipCode,
                                                        'mobile_number':
                                                            useraddressview
                                                                .userList
                                                                .value
                                                                .userAddress![
                                                                    index]
                                                                .mobileNumber,
                                                        // Add other fields as needed
                                                      });

                                                  // Check if the result is true (indicating a successful update)
                                                  if (result == true) {
                                                    // Refresh user addresses if the address was updated
                                                    useraddressview
                                                        .UseraddressView_apihit();
                                                  }
                                                },

                                                leftIcon: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 4.h),
                                                  child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgEditWhiteA70002,
                                                    height: 12.adaptSize,
                                                    width: 12.adaptSize,
                                                  ),
                                                ),
                                                buttonTextStyle:
                                                    CustomTextStyles
                                                        .bodySmallWhiteA70002,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 12.v),
                                        Container(
                                          width: 239.h,
                                          margin: EdgeInsets.only(
                                            left: 10.h,
                                            right: 10.h,
                                          ),
                                          child: Text(
                                              "${useraddressview.userList.value.userAddress?[index].address}",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                                fontFamily: 'Almarai',
                                              )),
                                        ),
                                        Text(
                                            "${useraddressview.userList.value.userAddress?[index].country}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Almarai',
                                            )),
                                        Text(
                                            "${useraddressview.userList.value.userAddress?[index].city}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Almarai',
                                            )),
                                        Text(
                                            "${useraddressview.userList.value.userAddress?[index].mobileNumber}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Almarai',
                                            )),
                                        SizedBox(height: 1.v),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.h),
                                          child: Row(
                                            children: [
                                              Text(
                                                "استخدم كعنوان الشحن",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontFamily: 'Almarai'),
                                              ),
                                              SizedBox(
                                                width: Get.width * .01,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isSelectedList[index] =
                                                        !isSelectedList[index];
                                                  });
                                                  if (isSelectedList[index]) {
                                                    arabicaddressIndexId =
                                                        useraddressview
                                                            .userList
                                                            .value
                                                            .userAddress?[index]
                                                            .id
                                                            .toString();
                                                    arabicaddressname.value =
                                                        useraddressview
                                                            .userList
                                                            .value
                                                            .userAddress?[index]
                                                            .address;
                                                  } else {
                                                    arabicaddressIndexId = null;
                                                  }

                                                  arabicaddressId =
                                                      useraddressview
                                                          .userList
                                                          .value
                                                          .userAddress?[index]
                                                          .id
                                                          .toString();
                                                  arabicaddressname.value =
                                                      useraddressview
                                                          .userList
                                                          .value
                                                          .userAddress?[index]
                                                          .address;
                                                  arabicaddressIndexId =
                                                      useraddressview
                                                          .userList
                                                          .value
                                                          .userAddress?[index]
                                                          .id
                                                          .toString();
                                                  print(arabicaddressIndexId);
                                                  Get.offAll(arabic_TabScreen(
                                                      index: 3));
                                                },
                                                child: Container(
                                                  height: Get.height * .02,
                                                  width: Get.width * .04,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    border: Border.all(
                                                      width: 2,
                                                      color: Color(0xffff8300),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: isSelectedList[index]
                                                      ? Center(
                                                          child: Icon(
                                                          Icons.check,
                                                          size: 10,
                                                          weight:
                                                              Checkbox.width,
                                                        )
                                                          //   ),
                                                          // ),
                                                          )
                                                      : null,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //          Padding(
                                        //   padding: EdgeInsets.only(left: 10.h),
                                        //   child: Row(
                                        //     children: [
                                        //       Checkbox(
                                        //         checkColor: Colors.white,
                                        //         fillColor: MaterialStatePropertyAll(Color(0xffff8300)),
                                        //         activeColor: Color(0xffff8300),

                                        //        value: isChecked,
                                        //   onChanged: (bool? value) {
                                        //     setState(() {
                                        //       isChecked = value ?? false;
                                        //     });
                                        //   },
                                        //       ),
                                        //       Padding(
                                        //         padding: EdgeInsets.only(
                                        // left: 6.h,
                                        // top: 3.v,
                                        //         ),
                                        //         child: Text(
                                        // "استخدم كعنوان الشحن",
                                        // style: TextStyle(
                                        //   fontSize: 14,
                                        //   fontWeight: FontWeight.w400,
                                        //   color: Colors.black,
                                        //   fontFamily: 'Almarai',
                                        // ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        SizedBox(height: 10.v),
                                      ],
                                    ),
                                  );
                                },
                              )),
                        ),
                        SizedBox(height: 30.v),
                        _buildSaveAddressButton(context),
                        SizedBox(
                          height: Get.height * .05,
                        )
                      ],
                    ),
                  ));
      }
    });
  }

  Widget _buildSaveAddressButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Get.off(() => add_new_Address_arabic());
      },
      text: "إضافة عنوان جديد",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
      ),
      buttonTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Almarai',
          fontWeight: FontWeight.bold,
          color: Colors.white),
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  Widget _buildInitialContainer() {
    // Customize this container according to your signup info
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Name", // Replace with signup info
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Your Mobile Number", // Replace with signup info
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Your Country", // Replace with signup info
            style: TextStyle(fontSize: 16),
          ),
          // Add other signup info as needed
          SizedBox(height: 20),
          _buildSaveAddressButton(context),
        ],
      ),
    );
  }
}
