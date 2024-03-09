import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:metro_pat_customer/Model/get_package_detail_model.dart';

class GetPackageDetailController{

  static Future getPackageDetail(GetPackageDetailModel package)async{
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/category.php'));
    request.fields.addAll({
      'action': 'get-package-details',
      'package_id': package.packageID!
    });


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