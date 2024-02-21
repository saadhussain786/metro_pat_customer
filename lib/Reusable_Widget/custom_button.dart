import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../Constants/size_config.dart';
class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback func;
  Color bg;
  CustomButton({
    super.key,
    required this.text,
    required this.func,
    required this.bg
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
          width: SizeConfig.screenWidth*0.5,
          height: SizeConfig.screenHeight*0.07,
          child: ElevatedButton(onPressed: func,
              style: ElevatedButton.styleFrom(
                  backgroundColor: bg
              ),
              child: Text(text,style: headingStyle(color1: kwhite),))),
    );
  }
}