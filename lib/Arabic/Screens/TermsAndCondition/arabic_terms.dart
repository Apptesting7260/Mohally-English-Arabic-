// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:http/http.dart' as http;
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_subtitle.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_icon_button.dart';

class TermsConditions_arabic extends StatefulWidget {
  const TermsConditions_arabic({Key? key})
      : super(
          key: key,
        );

  @override
  State<TermsConditions_arabic> createState() => _TermsConditions_arabicState();
}

class _TermsConditions_arabicState extends State<TermsConditions_arabic> {
  late Future<String> TermsandConditions;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  String? htmlresponse;

  fetchData() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://urlsdemo.net/mohally/api/view-pages'));
    request.fields.addAll(
        {'page_name': 'terms-and-conditions', 'language_type': 'Arabic'});

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
              text: "الأحكام والشروط",
              // margin: EdgeInsets.only(left: 10),
            ),
          ),
          body: htmlresponse == null
              ? Center(child: CircularProgressIndicator())
              : Directionality(
                  textDirection: TextDirection.rtl,
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
                )),
    );
  }
}
