import 'dart:math';

import 'package:flutter/material.dart';

const kwhite = Color(0xffFBFBFB);
const kgreen = Color(0xff3BAE81);
const kpurple = Color(0xff7F77EB);
const kgrey = Color(0xffB3B3B3);
const kblack = Color(0xff1B1B1B);
const kdarkgreen = Color(0xff49B851);
const kdarkpurple = Color(0xff491D61);
const ktextcolor = Color(0xff83AD6C);
const kred = Color(0xFFFF3C3C);
Color klightgrey=Colors.grey.shade300;
// Font Size
const double headingSize=18;
const double extraHeadingSize=22;
const double extraHeadingSize2=25;
const double popupTitle=12;
class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}