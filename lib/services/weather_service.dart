// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  String BaseURL = 'http://api.weatherapi.com/v1';
  String APIKey = 'ca261ea9d4f14a78a9285745232807';

  void getWeather({required String CityName}) async {
    Uri url =
        Uri.parse('$BaseURL/forecast.json?key=$APIKey&q=$CityName&days=7');

    http.Response response = await http.get(url);

    Map<dynamic, dynamic> JsonData = jsonDecode(response.body);
    print(JsonData);
  }
}
