import 'package:http/http.dart' as http;
class ProductService
{
  static Future<dynamic> FetchProduct([String id='16']) async
  {
    var headers = {
      'Cookie': 'PHPSESSID=ecfcfff78f5cb1b17bc465d2795ab97c; PHPSESSID=53556ff7163db1aae2ac0a68a4494889'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/category.php'));
    request.fields.addAll({
      'action': 'get-services-by-category-id',
      'category_id': id
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