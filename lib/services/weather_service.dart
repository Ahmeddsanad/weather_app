// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:http/http.dart' as http;

class WeatherService {
  void getWeather({required String CityName}) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=ca261ea9d4f14a78a9285745232807&q=London&aqi=no');

    http.Response response = await http.get(url);
  }
}
