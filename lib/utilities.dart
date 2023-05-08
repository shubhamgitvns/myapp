import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Utilities {
  static Future f(String link) async {
    final url = Uri.https("gist.githubusercontent.com", link, {});

    try {
      final response = await http.get(url);
      print("Response $response");
      print("Status ${response.statusCode}");
      print("Body ${response.body}");
      final jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
