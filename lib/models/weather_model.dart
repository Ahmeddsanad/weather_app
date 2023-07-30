// ignore_for_file: non_constant_identifier_names

class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? WeatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherStateName,
  });

  WeatherModel.fromJson(dynamic Data) {
    var JsonData = Data['forecast']['forecastday'][0]['day'];

    date = Data['location']['localtime'];
    WeatherStateName = JsonData['condition']['text'];
    maxTemp = JsonData['maxtemp_c'];
    minTemp = JsonData['mintemp_c'];
    temp = JsonData['avgtemp_c'];
  }
}
