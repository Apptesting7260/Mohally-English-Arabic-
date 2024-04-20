import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/theme/theme_helper.dart';

class NoProductFound extends StatefulWidget {
  final bool showAppBar;

  const NoProductFound({
    Key? key,
    this.showAppBar = false,
  }) : super(key: key);

  @override
  State<NoProductFound> createState() => _NoProductFoundState();
}

class _NoProductFoundState extends State<NoProductFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.showAppBar
          ? AppBar(
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
            )
          : null,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: Image.asset(
                  'assets/images/no_product.png',
                  color: Color(0xffff8300),
                  width: 250,
                  height: 200,
                )),
              ),
              Center(
                child: Text(
                  "Oops! We're Working Behind the Scene",
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: Color.fromARGB(120, 0, 0, 0), fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
