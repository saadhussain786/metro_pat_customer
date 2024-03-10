import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Model/get_service_by_category_id_model.dart';

class GetServiceBuCateforyIDController{

  static Future getServiceByCategoryID(GetServiceByCategoryIDModel cate)async{
    var headers = {
      'Cookie': 'PHPSESSID=f07b9c7401074bfdd93d550cf79cab1d'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/category.php'));
    request.fields.addAll({
      'action': 'get-services-by-category-id',
      'category_id': cate.cateID!
    });

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