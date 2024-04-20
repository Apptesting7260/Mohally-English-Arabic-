import 'package:flutter/material.dart';

class ImageStatusProvider extends ChangeNotifier {
  Map<int, bool> imageStatusMap = {};

  void setImageStatus(int index, bool isTapped) {
    imageStatusMap[index] = isTapped;
    notifyListeners();
  }

  bool getImageStatus(int index) {
    return imageStatusMap[index] ?? false;
  }
}
