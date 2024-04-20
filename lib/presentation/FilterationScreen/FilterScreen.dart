import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/view_models/controller/CategoryController/EnglishproductByCategoryListController.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final ProductsByCatIdListControllerEnglish controller =
      Get.put(ProductsByCatIdListControllerEnglish());

  @override
  void initState() {
    super.initState();
    controller.ProductByCatId_apiHit('153');
  }

  List<bool> isSelectedList = List.generate(100, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: Get.width * 0.055),
              child: Container(
                  width: Get.width * .06,
                  height: Get.height * .02,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromRGBO(244, 244, 244, 1)),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  )),
            ),
          ),
          title: Text(
            'Filter',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'League Spartan'),
          ),
        ),
        body: Obx(() {
          if (controller.rxRequestStatus.value == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  left: Get.width * 0.055,
                  right: Get.width * 0.055,
                  top: Get.height * 0.014),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.userlist.value.attributes?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.userlist.value.attributes![index]
                                      .attributeName
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                Obx(() {
                                  return IconButton(
                                      onPressed: () {
                                        controller.expandColorAndSize[index] =
                                            !controller
                                                .expandColorAndSize[index];
                                      },
                                      icon: Icon(controller
                                              .expandColorAndSize[index]
                                          ? Icons.keyboard_arrow_up_outlined
                                          : Icons
                                              .keyboard_arrow_down_outlined));
                                })
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Obx(() {
                              if (controller.expandColorAndSize[index] ==
                                  true) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 50,
                                          crossAxisCount: 2),
                                  itemCount: controller
                                          .userlist
                                          .value
                                          .attributes![index]
                                          .AttributeWithVariation
                                          ?.length ??
                                      0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, ind) {
                                    return Row(
                                      children: [
                                        Text(controller
                                            .userlist
                                            .value
                                            .attributes![index]
                                            .AttributeWithVariation![index]
                                            .variationName),
                                        SizedBox(
                                          width: Get.width * .04,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSelectedList[index] =
                                                  !isSelectedList[index];
                                            });

                                            /// for selected item amount
                                          },
                                          child: Container(
                                            height: Get.height * .03,
                                            width: Get.width * .05,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.black,
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: isSelectedList[index]
                                                ? Center(
                                                    child: Container(
                                                      height: Get.height * .02,
                                                      width: Get.width * .03,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                : null,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                // RadioListTile(
                                //   value: ind,
                                //   groupValue: controller
                                //       .selectedColorAndSizeIndex[index],
                                //   onChanged: (value) {},
                                //   title:
                                // Text(controller
                                //       .userlist
                                //       .value
                                //       .attributes![index]
                                //       .AttributeWithVariation![index]
                                //       .variationName),
                                // );
                              } else {
                                return SizedBox();
                              }
                            })
                          ],
                        );
                      },
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.userlist.value.tags?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller
                                      .userlist.value.tags![index].tagTitle
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                Obx(() {
                                  return IconButton(
                                      onPressed: () {
                                        controller.expandDetailAndCollarStyle[
                                                index] =
                                            !controller
                                                    .expandDetailAndCollarStyle[
                                                index];
                                      },
                                      icon: Icon(controller
                                              .expandDetailAndCollarStyle[index]
                                          ? Icons.keyboard_arrow_up_outlined
                                          : Icons
                                              .keyboard_arrow_down_outlined));
                                })
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Obx(() {
                              if (controller
                                      .expandDetailAndCollarStyle[index] ==
                                  true) {
                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 50,
                                          crossAxisCount: 2),
                                  itemCount: controller.userlist.value
                                          .tags![index].tagWithSubtag?.length ??
                                      0,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, ind) {
                                    return RadioListTile(
                                      value: ind,
                                      groupValue: controller
                                              .selectedDetailAndCollarStyleIndex[
                                          index],
                                      onChanged: (value) {},
                                      title: Text(controller
                                          .userlist
                                          .value
                                          .tags![index]
                                          .tagWithSubtag![ind]
                                          .subTagName),
                                    );
                                  },
                                );
                              } else {
                                return SizedBox();
                              }
                            })
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    button(
                        onTap: () {},
                        text: 'Apply',
                        color: Color.fromRGBO(255, 131, 0, 1),
                        textColor: Colors.white),
                    SizedBox(
                      height: 15,
                    ),
                    button(
                        onTap: () {},
                        text: 'Reset',
                        color: Colors.white,
                        textColor: Color.fromRGBO(255, 131, 0, 1),
                        boxBorder:
                            Border.all(color: Color.fromRGBO(255, 131, 0, 1)))
                  ],
                ),
              ),
            );
          }
        }));
  }

  Widget button(
      {required void Function() onTap,
      Color? color,
      BoxBorder? boxBorder,
      required String text,
      Color? textColor}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color,
              border: boxBorder),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ),
        ));
  }
}
