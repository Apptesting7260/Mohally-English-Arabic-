// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mohally/app_url/url.dart';
import 'package:mohally/core/utils/image_constant.dart';
import 'package:mohally/theme/custom_button_style.dart';
import 'package:mohally/theme/custom_text_style.dart';
import 'package:mohally/theme/theme_helper.dart';
import 'package:mohally/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:mohally/widgets/app_bar/custom_app_bar.dart';
import 'package:mohally/widgets/custom_elevated_button.dart';
import 'package:mohally/widgets/custom_image_view.dart';
import 'package:http/http.dart' as http;
import '../../widgets/app_bar/appbar_subtitle.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key})
      : super(
          key: key,
        );

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
        {'page_name': 'terms-and-conditions', 'language_type': 'English'});

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
          <!-- Your HTML content goes here -->
         $htmlresponse
                    ''',
                        ),
                      ]),
                    ),
                  ),
                )),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 60,
    leading: AppbarLeadingIconbuttonTwo(
      onTap: () {
        Get.back();
      },
      imagePath: ImageConstant.imgBack,
      margin: EdgeInsets.only(
        left: 20,
        top: 8,
        bottom: 8,
      ),
    ),
    title: AppbarSubtitle(
      text: "Terms And Conditions",
      margin: EdgeInsets.only(left: 16),
    ),
  );
}
