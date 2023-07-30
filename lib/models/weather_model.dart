// ignore_for_file: non_constant_identifier_names

class WeatherModel {
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String WeatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherStateName,
  });
}
