// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mohally/core/app_export.dart';
// import 'package:mohally/view_models/controller/SingleProduct_View_Controller/single_product_view_controller.dart';

// class seeAllimageScreen extends StatefulWidget {
//   const seeAllimageScreen({Key? key}) : super(key: key);

//   @override
//   State<seeAllimageScreen> createState() => _seeAllimageScreenState();
// }

// class _seeAllimageScreenState extends State<seeAllimageScreen> {
//   @override
//   void initState() {
//     super.initState();
//     productviewcontroller.Single_ProductApiHit();
//   }

//   EnglishSingleProductViewController productviewcontroller =
//       EnglishSingleProductViewController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           height: Get.height,
//           width: Get.width,
//           child: CarouselSlider(
//             items:
//                 //carouselItems,
//                 List.generate(
//               productviewcontroller.userList.value.productView?.galleryUrl ==
//                       null
//                   ? 0
//                   : productviewcontroller
//                       .userList.value.productView!.galleryUrl!.length,
//               (index) => Image.network(
//                 productviewcontroller
//                         .userList.value.productView?.galleryUrl?[index]
//                         .toString() ??
//                     "",
//               ),
//             ),
//             options: CarouselOptions(
//               autoPlay: true,
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
