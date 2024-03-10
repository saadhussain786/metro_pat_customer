import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Model/add_customer_model.dart';

import '../Views/Mobile_views/dashboard_screen.dart';

class CustomerAdd{

  static Future customerAdd(CustomerAddMddel customer, BuildContext context,File? userProfile)async{
    var headers = {
      'Cookie': 'PHPSESSID=f07b9c7401074bfdd93d550cf79cab1d'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/user.php'));
    request.fields.addAll({
      'username': customer.userName!,
      'profilename': customer.profileName!,
      'useremail': customer.userEmail!,
      'userpassword': customer.userPassword!,
      'confirmpassword': customer.confirmPassword!,
      'phone': customer.userPhone!,
      'company': customer.userCompany!,
      'action': 'add-new-customer'
    });
    request.files.add(await http.MultipartFile.fromPath('profileimage', userProfile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map map = jsonDecode(res);
      debugPrint("$map");
      if (map["success"] == true) {
        if(context.mounted){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
        }
      }
      else{
        if(context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Occurred")));
        }
      }
      return res;
    }
    else {
      debugPrint(response.reasonPhrase);
    }

  }

}