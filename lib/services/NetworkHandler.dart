import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "https://serene-citadel-05489.herokuapp.com";
  var log = Logger();

  Future<dynamic> get(var url) async {
    url = formater(url);
    // /user/register
    var response = await http.get(url);
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(var url, Map<String, String> body) async {
    url = formater(url);
    var response = await http.post(url, body: body);
    if (response.statusCode == 200 || response.statusCode == 200) {
      log.i(response.body);
      return response;
    }
    log.d(response.statusCode);
  }

  String formater(String url) {
    return baseurl + url;
  }
}
