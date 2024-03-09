import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Model/add_customer_model.dart';

class CustomerAdd{

  static Future customerAdd(CustomerAddMddel customer, File? userProfile)async{
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
      return res;
    }
    else {
      debugPrint(response.reasonPhrase);
    }

  }

}