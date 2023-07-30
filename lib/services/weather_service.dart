// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String BaseURL = 'http://api.weatherapi.com/v1';
  String APIKey = 'ca261ea9d4f14a78a9285745232807';

  Future<WeatherModel> getWeather({required String CityName}) async {
    Uri url =
        Uri.parse('$BaseURL/forecast.json?key=$APIKey&q=$CityName&days=7');

    http.Response response = await http.get(url);

    Map<dynamic, dynamic> Data = jsonDecode(response.body);

    print(Data);

    WeatherModel weather = WeatherModel.fromJson(Data);
    return weather;
  }
}


// print(JsonData);

    // String date = JsonData['location']['localtime'];

    // String Icon = JsonData['current']['condition']
        // ['https://cdn.weatherapi.com/weather/64x64/day/122.png'];

    // when we accessing a list '[ ]' We use [0] [1] ... [inf.]
    // when we accessing a map ['String from Json']

    // String temp = JsonData['forecast']['forecastday'][0]['day']['avgtemp_c'];
