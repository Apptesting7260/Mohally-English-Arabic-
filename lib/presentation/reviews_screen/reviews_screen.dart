import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mohally/data/response/status.dart';
import 'package:mohally/presentation/add_review_screen/add_review_screen.dart';
import 'package:mohally/view_models/controller/ProductAddReviewController/ProductAddreviewController.dart';
import 'package:mohally/view_models/controller/ProductViewController/productviewReviewcontroller.dart';
import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';

import 'package:flutter/material.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_rating_bar.dart';

String? addReviewId;

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  ViewReviewController _viewreviewcontroller = ViewReviewController();
  @override
  void initState() {
    super.initState();
    // reviewProductid = Get.arguments;
    // _viewreviewcontroller.reviewViewapiHit(context, reviewProductid.toString());
  }

  EnglishSingleProductViewController productviewcontroller =
      EnglishSingleProductViewController();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: Obx(() {
            if (_viewreviewcontroller.rxRequestStatus.value == Status.LOADING) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (_viewreviewcontroller.rxRequestStatus.value ==
                Status.ERROR) {
              return Center(
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
              ));
            } else {
              return Column(
                children: [
                  _buildAddReviewRow(context),
                  _viewreviewcontroller.userlist.value.productReview == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgRateReview1,
                              height: 100.adaptSize,
                              width: 100.adaptSize,
                              color: Color(0xffff8300),
                            ),
                            Text('No reviews are available at the moment !')
                          ],
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: _viewreviewcontroller
                                      .userlist.value.productReview?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 20.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * .01,
                                      ),
                                      // _buildRowItemsReviewsAnd(context),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_viewreviewcontroller.userlist.value.productReview?[index].ratting?.toString()}",
                                            style: CustomTextStyles
                                                .titleMediumInter,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 6.h,
                                              top: 2.v,
                                              bottom: 2.v,
                                            ),
                                            child: CustomRatingBar(
                                              initialRating:
                                                  _viewreviewcontroller
                                                      .userlist
                                                      .value
                                                      .productReview?[index]
                                                      .ratting
                                                      ?.toDouble(),
                                              itemSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 27.v),
                                      Text(
                                          "${_viewreviewcontroller.userlist.value.productReview?[index].userName.toString()}",
                                          style: TextStyle(
                                              fontFamily: 'League Spartan',
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),

                                      SizedBox(height: 4.v),
                                      Text(
                                          "${_viewreviewcontroller.userlist.value.productReview?[index].description.toString()}",
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'League Spartan',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(height: 13.v),
                                      //_buildListRectangle1(context),
                                      Container(
                                        height: Get.height * .1,
                                        child: ListView.separated(
                                          padding: EdgeInsets.only(
                                            left: 20.h,
                                            right: 20.h,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (
                                            context,
                                            index,
                                          ) {
                                            return SizedBox(
                                              width: Get.width * .04,
                                            );
                                          },
                                          itemCount: _viewreviewcontroller
                                                  .userlist
                                                  .value
                                                  .productReview?[index]
                                                  .galleryUrl
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            if (_viewreviewcontroller
                                                    .userlist
                                                    .value
                                                    .productReview?[index]
                                                    .galleryUrl ==
                                                null) {
                                              return Text("");
                                            } else {
                                              return SizedBox(
                                                height: 80.adaptSize,
                                                width: 80.adaptSize,
                                                child: CustomImageView(
                                                  imagePath:
                                                      "${_viewreviewcontroller.userlist.value.productReview?[index].galleryUrl ?? ''}",
                                                  height: 80.adaptSize,
                                                  width: 80.adaptSize,
                                                  radius: BorderRadius.circular(
                                                    8.h,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),

                                      Center(
                                        child: Divider(
                                          color: Color.fromARGB(40, 39, 39, 39),
                                          endIndent: 20,
                                          indent: 20,
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                  // _buildReview(context)
                ],
              );
            }
          })),
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
        text: "Item Reviews",
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddReviewRow(BuildContext context) {
    return Container(
      height: Get.height * .1,
      width: Get.width,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(250, 0, 50, 0),
            child: CustomElevatedButton(
              onPressed: () {
                addReviewId = _viewreviewcontroller
                    .userlist.value.productReview?[index].productId
                    .toString();
                setState(() {
                  AddreviewProductid = addReviewId;
                });
                print(AddreviewProductid);
                Get.to(() => AddReviewScreen());
              },
              height: 35.v,
              width: 114.h,
              text: "Add Review",
              margin: EdgeInsets.only(
                top: 5.v,
                bottom: 7.v,
              ),
              leftIcon: Container(
                margin: EdgeInsets.only(right: 5.h),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEditSquare,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                ),
              ),
              buttonTextStyle: CustomTextStyles.labelLargeWhiteA70001,
            ),
            //   ],
            // ),
          );
        },
      ),
    );
  }

  /// Section Widget

  /// Section Widget

  // Widget _buildReview(BuildContext context) {
  //   return Container(
  //     height: Get.height * .5,
  //     child: ListView.builder(
  //       physics: NeverScrollableScrollPhysics(),
  //       itemCount:
  //           _viewreviewcontroller.userlist.value.productReview?.length ?? 0,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: EdgeInsets.only(left: 20.h),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 height: Get.height * .04,
  //               ),
  //               // _buildRowItemsReviewsAnd(context),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "${_viewreviewcontroller.userlist.value.productReview?[index].ratting?.toString()}",
  //                     style: CustomTextStyles.titleMediumInter,
  //                   ),
  //                   Padding(
  //                     padding: EdgeInsets.only(
  //                       left: 6.h,
  //                       top: 2.v,
  //                       bottom: 2.v,
  //                     ),
  //                     child: CustomRatingBar(
  //                       initialRating: _viewreviewcontroller
  //                           .userlist.value.productReview?[index].ratting
  //                           ?.toDouble(),
  //                       itemSize: 16,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 27.v),
  //               Text(
  //                   "${_viewreviewcontroller.userlist.value.productReview?[index].userName.toString()}",
  //                   style: TextStyle(
  //                       fontFamily: 'League Spartan',
  //                       fontSize: 11,
  //                       fontWeight: FontWeight.w400,
  //                       color: Colors.black)),

  //               SizedBox(height: 4.v),
  //               Text(
  //                   "${_viewreviewcontroller.userlist.value.productReview?[index].description.toString()}",
  //                   maxLines: 4,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: TextStyle(
  //                       fontFamily: 'League Spartan',
  //                       color: Colors.black,
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.w400)),
  //               SizedBox(height: 13.v),
  //               //_buildListRectangle1(context),
  //               Container(
  //                 height: Get.height * .1,
  //                 child: ListView.separated(
  //                   padding: EdgeInsets.only(
  //                     left: 20.h,
  //                     right: 20.h,
  //                   ),
  //                   scrollDirection: Axis.horizontal,
  //                   separatorBuilder: (
  //                     context,
  //                     index,
  //                   ) {
  //                     return SizedBox(
  //                       width: Get.width * .04,
  //                     );
  //                   },
  //                   itemCount: _viewreviewcontroller.userlist.value
  //                           .productReview?[index].galleryUrl?.length ??
  //                       0,
  //                   itemBuilder: (context, index) {
  //                     if (_viewreviewcontroller.userlist.value
  //                             .productReview?[index].galleryUrl ==
  //                         null) {
  //                       return Text("");
  //                     } else {
  //                       return SizedBox(
  //                         height: 80.adaptSize,
  //                         width: 80.adaptSize,
  //                         child: CustomImageView(
  //                           imagePath:
  //                               "${_viewreviewcontroller.userlist.value.productReview?[index].galleryUrl.toString()}",
  //                           height: 80.adaptSize,
  //                           width: 80.adaptSize,
  //                           radius: BorderRadius.circular(
  //                             8.h,
  //                           ),
  //                           alignment: Alignment.center,
  //                         ),
  //                       );
  //                     }
  //                   },
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(left: 190.h),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     CustomImageView(
  //                       imagePath: ImageConstant.imgShare1,
  //                       height: 16.adaptSize,
  //                       width: 16.adaptSize,
  //                     ),
  //                     // SizedBox(
  //                     //   width: Get.width * .02,
  //                     // ),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 4.h),
  //                       child: Text('Share',
  //                           style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w400,
  //                               fontFamily: 'League Spartan',
  //                               color: Colors.black)),
  //                     ),

  //                     GestureDetector(
  //                       onTap: () {},
  //                       child: CustomImageView(
  //                         imagePath:
  //                             // ? ImageConstant.imgLike1
  //                             ImageConstant
  //                                 .imgLike1, // Update image path based on likeIsActive status
  //                         color: Colors
  //                             .black, // Update color based on likeIsActive status
  //                         height: 16.adaptSize,
  //                         width: 16.adaptSize,
  //                         margin: EdgeInsets.only(left: 10.h),
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: EdgeInsets.only(left: 4.h),
  //                       child: Text(
  //                           "Helpful(${productviewcontroller.womensDress_userlist.value.productReview?.productReviewDetails?[index].helpful.toString()})",
  //                           style: TextStyle(
  //                               fontSize: 12,
  //                               fontWeight: FontWeight.w400,
  //                               fontFamily: 'League Spartan',
  //                               color: Colors.black)),
  //                     ),

  //                     CustomImageView(
  //                       imagePath: ImageConstant.imgGroup239583,
  //                       height: 15.v,
  //                       width: 3.h,
  //                       margin: EdgeInsets.only(left: 10.h),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // SizedBox(height: 20.v),
  //               Center(
  //                 child: Divider(
  //                   color: Color.fromARGB(40, 39, 39, 39),
  //                   endIndent: 20,
  //                   indent: 20,
  //                   thickness: 1,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }


}
