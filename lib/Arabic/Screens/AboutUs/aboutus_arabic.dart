import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:mohally/theme/theme_helper.dart';

class AboutUsScreen_arabic extends StatefulWidget {
  const AboutUsScreen_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<AboutUsScreen_arabic> createState() => _AboutUsScreen_arabicState();
}

class _AboutUsScreen_arabicState extends State<AboutUsScreen_arabic> {
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
    request.fields.addAll({'page_name': 'about-us', 'language_type': 'Arabic'});
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
          appBar: AppBar(
            title: Text(
              'معلومات عنا',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Almarai',
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    width: Get.width * .07,
                    height: Get.height * .03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(90, 158, 158, 158)),
                    child: Icon(
                      Icons.arrow_back,
                    )),
              ),
            ),
          ),
          body: htmlresponse == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              HtmlWidget(
                                '''
        <!-- Your HTML content goes here -->
        $htmlresponse
              ''',
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}
//  Directionality(
// textDirection: TextDirection.rtl,
//  child: SingleChildScrollView(
//  child: Column(
// children: [
// Column(
// children: [
//  Padding(
//  padding: const EdgeInsets.fromLTRB(10,0,10,0),
//  child: Container(
// height:Get.height*.3,
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.all(Radius.circular(10)),
// image: DecorationImage(image: AssetImage('assets/images/aboutUs1.png'), fit: BoxFit.cover)
//  ),
//  ),
//  ),
// // Padding(
// // padding: const EdgeInsets.all(22.0),
// // child: FutureBuilder(
// // future: AboutUs, builder: ((context, snapshot) {
// //if (snapshot.connectionState == ConnectionState.waiting) {
// // return Center(child: CircularProgressIndicator());
// // } else if (snapshot.hasError) {
// // return Center(child: Text('Error: ${snapshot.error}'));
// // } else {
// // return Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Center(
// // child: Html(data: snapshot.data.toString()),
// // ),
// //SizedBox(height: 20),
 
//  //]
//  //);
//  // }
//  // }))
 
//  // ),
// SizedBox(height: Get.height*.02,),
//  Padding(
// padding: const EdgeInsets.fromLTRB(15,0,15,0),
// child: Align(
// alignment: Alignment.centerLeft,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('ما هو لوريم إيبسوم؟',style:TextStyle(
//  fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: 'Almarai',)
//  ),
//  SizedBox(height: Get.height*.02,),
//  Text('لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في الصناعة منذ القرن السادس عشر، عندما أخذت طابعة غير معروفة لوح الكتابة وخلطته لصنع نموذج كتاب. لقد صمدت ليس فقط لخمسة قرون، بل قفزت أيضًا إلى التنضيد الإلكتروني، وبقيت دون تغيير بشكل أساسي. انتشر بشكل كبير في ستينيات القرن الماضي مع إصدار أوراق Letraset التي تحتوي على مقاطع لوريم إيبسوم، ومؤخراً مع ظهور برامج النشر المكتبي مثل Aldus PageMaker والتي تضمنت إصدارات لوريم إيبسوم.'
//  ,maxLines: 20
//  ,style:TextStyle(
// fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey,fontFamily: 'Almarai',)
// ),
// SizedBox(height: Get.height*.03,)
// ],
// ),
// ),
//  ),
// Padding(
//  padding: const EdgeInsets.fromLTRB(10,0,10,0),
//  child: Container(
// height:Get.height*.3,
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.all(Radius.circular(10)),
// image: DecorationImage(image: AssetImage('assets/images/aboutUs2.png'), fit: BoxFit.cover)
// ),
//  ),
//  ),
// SizedBox(height: Get.height*.02,),
//  Padding(
// padding: const EdgeInsets.fromLTRB(15,0,15,0),
// child: Align(
// alignment: Alignment.centerLeft,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('ما هو لوريم إيبسوم؟',style:TextStyle(
// fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: 'Almarai',)
// ),
// SizedBox(height: Get.height*.02,),
//  Text('لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في الصناعة منذ القرن السادس عشر، عندما أخذت طابعة غير معروفة لوح الكتابة وخلطته لصنع نموذج كتاب. لقد صمدت ليس فقط لخمسة قرون، بل قفزت أيضًا إلى التنضيد الإلكتروني، وبقيت دون تغيير بشكل أساسي. انتشر بشكل كبير في ستينيات القرن الماضي مع إصدار أوراق Letraset التي تحتوي على مقاطع لوريم إيبسوم، ومؤخراً مع ظهور برامج النشر المكتبي مثل Aldus PageMaker والتي تضمنت إصدارات لوريم إيبسوم.'
//  ,maxLines: 20
//  ,style:TextStyle(
// fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey,fontFamily: 'Almarai',)
// ),
// SizedBox(height: Get.height*.03,)
// ],
// ),
// ),
//  ),
//  Padding(
//  padding: const EdgeInsets.fromLTRB(10,0,10,0),
//  child: Container(
// height:Get.height*.3,
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.all(Radius.circular(10)),
// image: DecorationImage(image: AssetImage('assets/images/aboutUs3.png'), fit: BoxFit.cover)
// ),
//  ),
//  ),
// SizedBox(height: Get.height*.02,),
//  Padding(
// padding: const EdgeInsets.fromLTRB(15,0,15,0),
// child: Align(
// alignment: Alignment.centerLeft,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('ما هو لوريم إيبسوم؟',style:TextStyle(
// fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black,fontFamily: 'Almarai',)
// ),
// SizedBox(height: Get.height*.02,),
//  Text('لوريم إيبسوم هو ببساطة نص وهمي من صناعة الطباعة والتنضيد. لقد كان لوريم إيبسوم هو النص الوهمي القياسي في الصناعة منذ القرن السادس عشر، عندما أخذت طابعة غير معروفة لوح الكتابة وخلطته لصنع نموذج كتاب. لقد صمدت ليس فقط لخمسة قرون، بل قفزت أيضًا إلى التنضيد الإلكتروني، وبقيت دون تغيير بشكل أساسي. انتشر بشكل كبير في ستينيات القرن الماضي مع إصدار أوراق Letraset التي تحتوي على مقاطع لوريم إيبسوم، ومؤخراً مع ظهور برامج النشر المكتبي مثل Aldus PageMaker والتي تضمنت إصدارات لوريم إيبسوم.'
//  ,maxLines: 20
//  ,style:TextStyle(
// fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey,fontFamily: 'Almarai',)
// ),

// ],
// ),
// ),
//  ),
// SizedBox(height: Get.height*.03,),
//  _buildContainer(context)
//  ],
// ),
//  ],
// ),
// ),
// ),
// );
// }


// Widget _buildContainer(BuildContext context) {
// return Container(
// alignment: Alignment.center,
// width: Get.width,
// height: Get.height*1.4,
// color: Color(0xfff4f4f4),
// child: Column(
// children: [
//  SizedBox(height: Get.height*.04,),
//  Padding(
//  padding: const EdgeInsets.fromLTRB(30,0,30,0),
//  child: Container(
//  height: Get.height*.3,
//  width: Get.width*1,
//  decoration:BoxDecoration(color: Colors.white,
//  borderRadius: BorderRadius.all(Radius.circular(10)),
//  boxShadow: [
// BoxShadow(
// color:
// Colors.black.withOpacity(0.1), // Set the shadow color
// spreadRadius: 1.0, // Set the spread radius
// blurRadius: 2.0, // Set the blur radius
// offset: Offset(0, 1), // Offset of the shadow
// ),
//  ],
//  ),
//  child: Padding(padding: EdgeInsets.only(top: 10),
//  child:
//  Column(
// children: [
//  SizedBox(height: Get.height*.01,),
//  Image.asset('assets/images/Empowerment.png'),
//  SizedBox(height: Get.height*.01,),
//  Text(
// "التمكين",
// style: CustomTextStyles.titleLargeBold,
// ),
//  SizedBox(height: Get.height*.02,),
//  Text( " الجميع يستحق أن يعيش الحياة" , style: CustomTextStyles.bodyLargeGray50001_3,),
// Text( "يحلمون بامتلاك." , style: CustomTextStyles.bodyLargeGray50001_3,),
// ],
//  ),
//  ),
//  ),
//  ),
//  SizedBox(height: Get.height*.03,),
// Padding(
//  padding: const EdgeInsets.fromLTRB(30,0,30,0),
//  child: Container(
//  height: Get.height*.3,
//  width: Get.width*1,
//  decoration:BoxDecoration(color: Colors.white,
//  borderRadius: BorderRadius.all(Radius.circular(10)),
//  boxShadow: [
// BoxShadow(
// color:
// Colors.black.withOpacity(0.1), // Set the shadow color
// spreadRadius: 1.0, // Set the spread radius
// blurRadius: 2.0, // Set the blur radius
// offset: Offset(0, 1), // Offset of the shadow
// ),
//  ],
//  ),
//  child: Padding(padding: EdgeInsets.only(top: 10),
//  child:
//  Column(
// children: [
//  SizedBox(height: Get.height*.01,),
// Image.asset('assets/images/Inclusion.png'),
//  SizedBox(height: Get.height*.01,),
//  Text(
// "الشمول والتنوع",
// style: CustomTextStyles.titleLargeBold,
// ),
//  SizedBox(height: Get.height*.02,),
//  Text( " الجميع يستحق أن يعيش الحياة" , style: CustomTextStyles.bodyLargeGray50001_3,),
// Text( "يحلمون بامتلاك." , style: CustomTextStyles.bodyLargeGray50001_3,),
// ],
//  ),
//  ),
//  ),
//  ),
//  SizedBox(height: Get.height*.03,),
// Padding(
//  padding: const EdgeInsets.fromLTRB(30,0,30,0),
//  child: Container(
//  height: Get.height*.3,
//  width: Get.width*1,
//  decoration:BoxDecoration(color: Colors.white,
//  borderRadius: BorderRadius.all(Radius.circular(10)),
//  boxShadow: [
// BoxShadow(
// color:
// Colors.black.withOpacity(0.1), // Set the shadow color
// spreadRadius: 1.0, // Set the spread radius
// blurRadius: 2.0, // Set the blur radius
// offset: Offset(0, 1), // Offset of the shadow
// ),
//  ],
//  ),
//  child: Padding(padding: EdgeInsets.only(top: 10),
//  child:
//  Column(
// children: [
//  SizedBox(height: Get.height*.01,),
// Image.asset('assets/images/Integrity.png'),
//  SizedBox(height: Get.height*.01,),
//  Text(
// "نزاهة",
// style: CustomTextStyles.titleLargeBold,
// ),
//  SizedBox(height: Get.height*.02,),
//  Text( " الجميع يستحق أن يعيش الحياة" , style: CustomTextStyles.bodyLargeGray50001_3,),
// Text( "يحلمون بامتلاك." , style: CustomTextStyles.bodyLargeGray50001_3,),
// ],
//  ),
//  ),
//  ),
//  ),
//  SizedBox(height: Get.height*.03,),
// Padding(
//  padding: const EdgeInsets.fromLTRB(30,0,30,0),
//  child: Container(
//  height: Get.height*.3,
//  width: Get.width*1,
//  decoration:BoxDecoration(color: Colors.white,
//  borderRadius: BorderRadius.all(Radius.circular(10)),
//  boxShadow: [
// BoxShadow(
// color:
// Colors.black.withOpacity(0.1), // Set the shadow color
// spreadRadius: 1.0, // Set the spread radius
// blurRadius: 2.0, // Set the blur radius
// offset: Offset(0, 1), // Offset of the shadow
// ),
//  ],
//  ),
//  child: Padding(padding: EdgeInsets.only(top: 10),
//  child:
//  Column(
// children: [
//  SizedBox(height: Get.height*.01,),
//  Image.asset('assets/images/Socially.png'),
//  SizedBox(height: Get.height*.01,),
//  Text(
// "مسؤول إجتماعيا",
// style: CustomTextStyles.titleLargeBold,
// ),
//  SizedBox(height: Get.height*.02,),

//  Text( " الجميع يستحق أن يعيش الحياة" , style: CustomTextStyles.bodyLargeGray50001_3,),
// Text( "يحلمون بامتلاك." , style: CustomTextStyles.bodyLargeGray50001_3,),
// ],
//  ),
//  ),
//  ),
//  ),
 
//  ],
// ),
// );

