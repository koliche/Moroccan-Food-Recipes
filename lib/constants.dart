import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kPrimaryColor = Color.fromARGB(255, 83, 196, 141);
const kPrimaryAccetsColor = Color.fromARGB(255, 26, 126, 78);
const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);

// For get the size of anny window :::::::::::::::::::
class SizeConfig {
  void init(BuildContext context) {
    MediaQueryData _mediaQueryData;
    double screenWidth;
    double screenHeight;
    double defaultSize;
    Orientation orientation;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
