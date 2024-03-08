import 'package:http/http.dart' as http;
class CategoryService
{
  static Future<dynamic> fetchCategory() async
  {
    var headers = {
      'Cookie': 'PHPSESSID=ecfcfff78f5cb1b17bc465d2795ab97c; PHPSESSID=53556ff7163db1aae2ac0a68a4494889'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://patcrm.codetech.pk/pat-crm/yoc/category.php'));
    request.fields.addAll({
      'action': 'get-categories'
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