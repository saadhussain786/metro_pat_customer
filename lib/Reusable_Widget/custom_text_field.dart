import 'package:flutter/material.dart';

import '../Constants/constants.dart';
class CustomTextField extends StatelessWidget {
TextEditingController controller;
String label;
bool isHide;
IconData icon;
bool isValid;
final TextInputType inputType;
CustomTextField(
{required this.controller, required this.label, required this.isHide, required this.icon, this.isValid=true,this.inputType=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      validator: (value) {
        if (isValid == true) {
          if (value!.isEmpty) {
            return "$label is Empty";
          }
          return null;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: kgrey,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: kgreen,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: kgrey,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: kred,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20)
          ),
          prefixIcon: Icon(icon)

      ),
    );
  }
}