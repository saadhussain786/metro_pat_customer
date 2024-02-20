import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

TextStyle   headingStyle({Color color1=kblack,FontWeight fontWeight1=FontWeight.w300})
{
  return GoogleFonts.inder(
    fontWeight: fontWeight1,
    color: color1,
    fontSize: headingSize,
  );
}
//Saad
TextStyle headingStyle1({Color color1=kblack})
{
  return GoogleFonts.inder(
      fontWeight: FontWeight.w600,
      color: color1,
      fontSize: extraHeadingSize
  );
}

TextStyle welcomeHeadingStyle1({Color color1=kblack})
{
  return GoogleFonts.aclonica(
      fontWeight: FontWeight.w600,
      color: color1,
      fontSize: extraHeadingSize2
  );
}
TextStyle popupHeading1({Color color1=kblack})
{
  return GoogleFonts.aclonica(
      fontWeight: FontWeight.w600,
      color: color1,
      fontSize: 20
  );
}
TextStyle jobHeading({Color? color=kgreen})
{
  return GoogleFonts.aclonica(
    fontSize: headingSize,
    fontWeight: FontWeight.bold,
    color: color,
    shadows: [
      const Shadow(
        color: Colors.black,
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
}

TextStyle jobHeading1({Color? color=kgreen})
{
  return GoogleFonts.aclonica(
    fontSize: extraHeadingSize2,
    fontWeight: FontWeight.bold,
    color: color,
    shadows: [
      const Shadow(
        color: Colors.black,
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
  );
}
TextStyle popupHeading({Color? color=kblack})
{
  return GoogleFonts.inder(
    fontSize: popupTitle,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

SizedBox verticalSpace(double value)
{
  return SizedBox(
    height: SizeConfig.screenHeight*value,
  );
}
SizedBox horizontalSpace(double value)
{
  return SizedBox(
    width: SizeConfig.screenWidth*value,
  );
}
