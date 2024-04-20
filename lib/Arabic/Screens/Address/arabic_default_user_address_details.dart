import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mohally/core/app_export.dart';
import 'package:mohally/view_models/controller/MyAccount_controller/myAccount_controller.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';

class Default_address_view_arabic extends StatefulWidget {
  const Default_address_view_arabic({Key? key}) : super(key: key);

  @override
  State<Default_address_view_arabic> createState() =>
      _Default_address_view_arabicState();
}

class _Default_address_view_arabicState
    extends State<Default_address_view_arabic> {
  loc.LocationData? _currentLocation;
  String address1 = "";
  String address2 = "";
  String address3 = "";
  bool isLoading = false;

  Future<void> _getLocation() async {
    setState(() {
      isLoading = true;
    });
    try {
      loc.Location location = loc.Location();
      _currentLocation = await location.getLocation();
      _getAddressFromCoordinates();
    } catch (e) {
      print("Error getting location: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _getAddressFromCoordinates() async {
    if (_currentLocation != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude!,
          _currentLocation!.longitude!,
        );

        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          setState(() {
            address1 =
                "${placemark.name}, ${placemark.subLocality},${placemark.locality},  ";
            address2 =
                "${placemark.postalCode},${placemark.administrativeArea},";
            address3 = "${placemark.country}";
            isLoading = false;
          });
        } else {
          setState(() {
            address1 = "Address not found";
            address2 = "Address not found";
            isLoading = false;
          });
        }
      } catch (e) {
        print("Error getting address: $e");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  final _controller = Get.put(MyAccountController());

  @override
  void initState() {
    super.initState();
    _getLocation();
    _controller.fetchMyAccountData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: AppDecoration.fillGray.copyWith(
              color: Color(0xffFF8300),
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                SizedBox(height: 12.v),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller.MyAccount.value.userDetails!.firstName
                                  .toString(),
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            Text(
                              "${_controller.MyAccount.value.userDetails!.phone.toString()}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'League Spartan',
                              ),
                            ),
                            Text(
                              "$address1",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'League Spartan',
                              ),
                            ),
                            Text(
                              "$address2",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'League Spartan',
                              ),
                            ),
                            Text(
                              "$address3",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'League Spartan',
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 1.v),
                SizedBox(height: 10.v),
              ],
            ),
          ),
        ));
  }
}
