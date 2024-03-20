import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Views/Mobile_views/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/login_model.dart';
class LoginController{
   static Future userLogin(UserLog login, BuildContext context) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'PHPSESSID=3a0e64ddb76f1c774bb3fcf3cb08ff65'
      };
      var request = http.Request(
          'POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/auth.php'));
      request.bodyFields = {
        'action': 'Login',
        'username_val': login.username!,
        'password_val': login.userPassword!,
        'login_source': 'patcrm'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        Map map = jsonDecode(res);
        String uID = map['detail']['user']['ID'];

        if (map["success"] == true && map["detail"]["user"]["user_role"] == "4"){
          SharedPreferences userCred = await SharedPreferences.getInstance();
          userCred.setString("uID",uID);
          if (context.mounted) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const DashboardScreen(),
                ));
          }
        }
        else if (map["success"] == false){
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed")));
          }
        }
        else{
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Undefine error Occurred")));
          }
        }
      } else {
        if(context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username Or Password Incorrect")));
        }
      }
    }
    catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username Or Password Incorrect")));
      }
    }
  }
}