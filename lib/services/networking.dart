import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper({ this.url });

  final String url;

  Future getData() async {
    http.Response response = await http.get(url); //async fetch call to openWeather API to request data
    if( response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); //converting JSON format to flutter understandable form
    } else {
      print(response.statusCode);
    }
  }
}