// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mohally/Arabic/Arabic_controllers/arabic_searchCategories_Controller.dart';
// import 'package:mohally/Arabic/Screens/Arabic_CategoryScreen/arabic_no_product_found.dart';
// import 'package:mohally/core/app_export.dart';
// import 'package:mohally/data/response/status.dart';
// class MensClothing extends StatefulWidget {
//   const MensClothing({Key? key}) : super(key: key);

//   @override
//   State<MensClothing> createState() => _MensClothingState();
// }

// class _MensClothingState extends State<MensClothing> {

  
//   @override
//   void initState() {
//     super.initState();
//     // TODO: implement initState
//     // subCategoriesController.Subcategory_ApiHit();
//   MensClothing.Search_Categories();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       (){
//  if (MensClothing.rxRequestStatus.value == Status.LOADING) {
//         return const Scaffold(
//           body: Center(child: CircularProgressIndicator()),
//         );
//       }  else {
// return 
// MensClothing.userList.value.searchMainCat ==  null ||
//                                     MensClothing.userList.value
//                                             .searchMainCat?.length ==
//                                         0
//                                 ? Center(child:  Text('Error: ${MensClothing.error.value}'))
//                                 :
// Container(
//                                     color: Colors.white,
//                                     child: Center(
//                                       child: GridView.builder(
//                                         shrinkWrap: true,
//                                         gridDelegate:
//                                             SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 3,
//                                           crossAxisSpacing: 8.0,
//                                           mainAxisSpacing: 8.0,
//                                           mainAxisExtent: Get.height*.2
//                                         ),
//                                         itemCount: MensClothing.userList.value.searchMainCat?.length ?? 0,
//                                         itemBuilder: (context, index) {
//                                           return Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             GestureDetector(
//                                               onTap: (){
//                                                 _navigateaftertapped(context,index);
//                                               },
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(38.0),
//                                                 child: Image.network(
//                                                    "${MensClothing.userList.value.searchMainCat?[index].imageUrl.toString()}",
//                                                   height: 68,
//                                                   width: 68,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 5.v),
//                                             Align(
//                                               alignment: Alignment.center,
//                                               child: Text(
//                                               "${MensClothing.userList.value.searchMainCat?[index].aCategoryName.toString()}",
//                                                 style:
//                                                 TextStyle(color: Color(0xFF272727),
//                             fontSize: 12,
//                            fontFamily: 'Almarai',
//                            fontWeight: FontWeight.w500,)
//                                                 // theme.textTheme.bodySmall,
//                                                 // overflow: TextOverflow.ellipsis,
//                                                 // maxLines: 1,
//                                               ),
//                                             )
//                                           ],
//                                         );
 
//                                         },
//                                       ),
                            
//                                     ),
//                                   );
      
//       }}
//     );
//   }
//   void _navigateaftertapped(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
//       break;
//     case 1:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
//       break;
//       case 2:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
//       break;
//        case 3:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
//       break;
//        case 4:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
//       break;
//        case 5:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => NoProductFound02()),
//       );
     
//       break;
//     // Add more cases for other indices and screens
//     // ...
//   }
// }
// }