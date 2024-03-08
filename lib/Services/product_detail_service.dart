import 'package:http/http.dart' as http;
class DetailService
{
  static Future<dynamic> GetProductDetail({required String productId}) async
  {
    var headers = {
      'Cookie': 'PHPSESSID=226d8fe6d4d65892316f6a253d2efe20'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/category.php'));
    request.fields.addAll({
      'action': 'get-package-details',
      'package_id': '36'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res=await response.stream.bytesToString();
      return res;
    }
    else {
      print(response.reasonPhrase);
    }

  }

}