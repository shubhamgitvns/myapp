import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Downloader
{

  static Future download(String site, String link) async {
    // final url = Uri.https("gist.githubusercontent.com", link, {});
    final url = Uri.https(site, link, {});
    try {
      //http.get that work is download the data from internet or fetch the data from internet
      final response = await http.get(url);
      // print("Response $response");
      //response.statusCode is response data is success fully downloaded this code is 200
       print("Status ${response.statusCode}");
      //response.body is data those write in json body
      // print("Body ${response.body}");

      // Convert.jsonDecode is convert string data in json.
      final jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);

      return jsonResponse;
    }
    catch (e) {
      print(e);
      return false;
    }
  }
}

