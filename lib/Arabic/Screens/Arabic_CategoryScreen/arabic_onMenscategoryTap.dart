// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_sub_category_Womens_pants_Controller.dart';
// import 'package:mohally/core/app_export.dart';
// import 'package:mohally/data/response/status.dart';

// class MensTap extends StatefulWidget {
//   const MensTap({Key? key}) : super(key: key);

//   @override
//   State<MensTap> createState() => _MensTapState();
// }

// class _MensTapState extends State<MensTap> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     subMensCategoriesController.SubMensApihit();
//   }

//   // SubMensCategoriesController subMensCategoriesController =
//   //     SubMensCategoriesController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         if (subMensCategoriesController.rxRequestStatus.value ==
//             Status.LOADING) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         } else {
//           return subMensCategoriesController
//                           .userList.value.seeAllMainCategory ==
//                       null ||
//                   subMensCategoriesController
//                           .userList.value.seeAllMainCategory?.length ==
//                       0
//               ? Center(
//                   child:
//                       Text('Error: ${subMensCategoriesController.error.value}'))
//               : Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 350, right: 10, left: 10),
//                   child: Container(
//                     color: Colors.white,
//                     child: Center(
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             crossAxisSpacing: 8.0,
//                             mainAxisSpacing: 8.0,
//                             mainAxisExtent: Get.height * .2),
//                         itemCount: subMensCategoriesController
//                                 .userList.value.seeAllMainCategory?.length ??
//                             0,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(38.0),
//                                 child: Image.network(
//                                   "${subMensCategoriesController.userList.value.seeAllMainCategory?[index].imageUrl.toString()}",
//                                   height: 68,
//                                   width: 68,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               SizedBox(height: 5.v),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                     "${subMensCategoriesController.userList.value.seeAllMainCategory?[index].aCategoryName.toString()}",
//                                     style: TextStyle(
//                                       color: Color(0xFF272727),
//                                       fontSize: 12,
//                                       fontFamily: 'League Spartan',
//                                       fontWeight: FontWeight.w500,
//                                     )
//                                     // theme.textTheme.bodySmall,
//                                     // overflow: TextOverflow.ellipsis,
//                                     // maxLines: 1,
//                                     ),
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//         }
//       }),
//     );
//   }
// }
