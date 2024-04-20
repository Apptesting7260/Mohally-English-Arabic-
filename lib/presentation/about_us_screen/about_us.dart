// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:mohally/widgets/custom_icon_button.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late Future<String> AboutUs;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String? htmlresponse;

  fetchData() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://urlsdemo.net/mohally/api/view-pages'));
    request.fields
        .addAll({'page_name': 'about-us', 'language_type': 'English'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      setState(() {
        htmlresponse = responseBody;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: htmlresponse == null
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        HtmlWidget(
                          '''
         $htmlresponse
                    ''',
                        ),
                      ]),
                    ),
                  ),
                )),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: CustomIconButton(
            onTap: () {
              Get.back();
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
    );
  }
}
// SingleChildScrollView(
//         child: Column(
//           children: [
//             Column(
//               children: [
//                  Padding(
//                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                        child: Container(
//                         height:Get.height*.3,
//                         decoration: BoxDecoration(
//                           color: Colors.black54,
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(image: AssetImage('assets/images/aboutUs1.png'), fit: BoxFit.cover)
//                         ),
//                        ),
//                      ),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(22.0),
//                 //   child: FutureBuilder(
//                 //     future: AboutUs, builder: ((context, snapshot) {
//                 //        if (snapshot.connectionState == ConnectionState.waiting) {
//                 //         return Center(child: CircularProgressIndicator());
//                 //       } else if (snapshot.hasError) {
//                 //         return Center(child: Text('Error: ${snapshot.error}'));
//                 //       } else {
//                 //         return Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Center(
//                 //               child: Html(data: snapshot.data.toString()),
//                 //             ),
//                 //             SizedBox(height: 20),

//                 //           ]
//                 //         );
//                 //     }
//                 //     }))

//                 // ),
//                   SizedBox(height: Get.height*.02,),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15,0,15,0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('What is Lorem Ipsum?',style:TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black, fontFamily:'League Spartan ',  )
//                           ),
//                           SizedBox(height: Get.height*.02,),
//                            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
//                            ,maxLines: 20
//                            ,style:TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey, fontFamily:'League Spartan ',  )
//                           ),
//                           SizedBox(height: Get.height*.03,)
//                       ],
//                     ),
//                   ),
//                 ),
//                  Padding(
//                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                        child: Container(
//                         height:Get.height*.3,
//                         decoration: BoxDecoration(
//                           color: Colors.black54,
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(image: AssetImage('assets/images/aboutUs2.png'), fit: BoxFit.cover)
//                         ),
//                        ),
//                      ),
//                         SizedBox(height: Get.height*.02,),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15,0,15,0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('What is Lorem Ipsum?',style:TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black, fontFamily:'League Spartan ',  )
//                           ),
//                           SizedBox(height: Get.height*.02,),
//                            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
//                            ,maxLines: 20
//                            ,style:TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey, fontFamily:'League Spartan ',  )
//                           ),
//                           SizedBox(height: Get.height*.03,)
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                        child: Container(
//                         height:Get.height*.3,
//                         decoration: BoxDecoration(
//                           color: Colors.black54,
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           image: DecorationImage(image: AssetImage('assets/images/aboutUs3.png'), fit: BoxFit.cover)
//                         ),
//                        ),
//                      ),
//                         SizedBox(height: Get.height*.02,),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15,0,15,0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('What is Lorem Ipsum?',style:TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black, fontFamily:'League Spartan ',  )
//                           ),
//                           SizedBox(height: Get.height*.02,),
//                            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
//                            ,maxLines: 20
//                            ,style:TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey, fontFamily:'League Spartan ',  )
//                           ),

//                       ],
//                     ),
//                   ),
//                 ),
//                  SizedBox(height: Get.height*.03,),
//                           _buildContainer(context)
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildContainer(BuildContext context) {
//   return Container(
//     alignment: Alignment.center,
//     width: Get.width,
//     height: Get.height*1.4,
//     color:   Color(0xfff4f4f4),
//     child: Column(
//       children: [
//         SizedBox(height: Get.height*.04,),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(30,0,30,0),
//           child: Container(
//             height: Get.height*.3,
//             width: Get.width*1,
//             decoration:BoxDecoration(color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             boxShadow: [
//                     BoxShadow(
//                       color:
//                           Colors.black.withOpacity(0.1), // Set the shadow color
//                       spreadRadius: 1.0, // Set the spread radius
//                       blurRadius: 2.0, // Set the blur radius
//                       offset: Offset(0, 1), // Offset of the shadow
//                     ),
//                   ],
//             ),
//             child: Padding(padding: EdgeInsets.only(top: 10),
//             child:
//             Column(
//               children: [
//                 SizedBox(height: Get.height*.01,),
//                  Image.asset('assets/images/Empowerment.png'),
//                 SizedBox(height: Get.height*.01,),
//                 Text(
//                         "Empowerment",
//                         style: CustomTextStyles.titleLargeBold,
//                       ),
//                      SizedBox(height: Get.height*.02,),

//           Text( " Everyone deserves to live the life" , style: CustomTextStyles.bodyLargeGray50001_3,  ),
//          Text( "they dream of having." , style: CustomTextStyles.bodyLargeGray50001_3,),
//               ],
//             ),
//             ),
//             ),
//             ),
//             SizedBox(height: Get.height*.03,),
//              Padding(
//           padding: const EdgeInsets.fromLTRB(30,0,30,0),
//           child: Container(
//             height: Get.height*.3,
//             width: Get.width*1,
//             decoration:BoxDecoration(color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             boxShadow: [
//                     BoxShadow(
//                       color:
//                           Colors.black.withOpacity(0.1), // Set the shadow color
//                       spreadRadius: 1.0, // Set the spread radius
//                       blurRadius: 2.0, // Set the blur radius
//                       offset: Offset(0, 1), // Offset of the shadow
//                     ),
//                   ],
//             ),
//             child: Padding(padding: EdgeInsets.only(top: 10),
//             child:
//             Column(
//               children: [
//                 SizedBox(height: Get.height*.01,),
//                  Image.asset('assets/images/Inclusion.png'),
//                 SizedBox(height: Get.height*.01,),
//                 Text(
//                         "Inclusion and diversity",
//                         style: CustomTextStyles.titleLargeBold,
//                       ),
//                      SizedBox(height: Get.height*.02,),

//           Text( " Everyone deserves to live the life" , style: CustomTextStyles.bodyLargeGray50001_3,  ),
//          Text( "they dream of having." , style: CustomTextStyles.bodyLargeGray50001_3,),
//               ],
//             ),
//             ),
//             ),
//             ),
//             SizedBox(height: Get.height*.03,),
//              Padding(
//           padding: const EdgeInsets.fromLTRB(30,0,30,0),
//           child: Container(
//             height: Get.height*.3,
//             width: Get.width*1,
//             decoration:BoxDecoration(color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             boxShadow: [
//                     BoxShadow(
//                       color:
//                           Colors.black.withOpacity(0.1), // Set the shadow color
//                       spreadRadius: 1.0, // Set the spread radius
//                       blurRadius: 2.0, // Set the blur radius
//                       offset: Offset(0, 1), // Offset of the shadow
//                     ),
//                   ],
//             ),
//             child: Padding(padding: EdgeInsets.only(top: 10),
//             child:
//             Column(
//               children: [
//                SizedBox(height: Get.height*.01,),
//                 Image.asset('assets/images/Integrity.png'),
//                 SizedBox(height: Get.height*.01,),
//                 Text(
//                         "Integrity",
//                         style: CustomTextStyles.titleLargeBold,
//                       ),
//                      SizedBox(height: Get.height*.02,),

//           Text( " Everyone deserves to live the life" , style: CustomTextStyles.bodyLargeGray50001_3,  ),
//          Text( "they dream of having." , style: CustomTextStyles.bodyLargeGray50001_3,),
//               ],
//             ),
//             ),
//             ),
//             ),
//             SizedBox(height: Get.height*.03,),
//              Padding(
//           padding: const EdgeInsets.fromLTRB(30,0,30,0),
//           child: Container(
//             height: Get.height*.3,
//             width: Get.width*1,
//             decoration:BoxDecoration(color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             boxShadow: [
//                     BoxShadow(
//                       color:
//                           Colors.black.withOpacity(0.1), // Set the shadow color
//                       spreadRadius: 1.0, // Set the spread radius
//                       blurRadius: 2.0, // Set the blur radius
//                       offset: Offset(0, 1), // Offset of the shadow
//                     ),
//                   ],
//             ),
//             child: Padding(padding: EdgeInsets.only(top: 10),
//             child:
//             Column(
//               children: [
//                SizedBox(height: Get.height*.01,),
//                 Image.asset('assets/images/Socially.png'),
//                 SizedBox(height: Get.height*.01,),
//                 Text(
//                         "Socially responsible",
//                         style: CustomTextStyles.titleLargeBold,
//                       ),
//                      SizedBox(height: Get.height*.02,),

//           Text( " Everyone deserves to live the life" , style: CustomTextStyles.bodyLargeGray50001_3,  ),
//          Text( "they dream of having." , style: CustomTextStyles.bodyLargeGray50001_3,),
//               ],
//             ),
//             ),
//             ),
//             ),

//             ],
//     ),
//   );
//     }
// }
