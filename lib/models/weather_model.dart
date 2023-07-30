// ignore_for_file: non_constant_identifier_names

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String WeatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherStateName,
  });

  factory WeatherModel.fromJson(dynamic Data) {
    var JsonData = Data['forecast']['forecastday'][0]['day'];
    // print(JsonData);
    return WeatherModel(
      WeatherStateName: JsonData['condition']['text'],
      date: Data['location']['localtime'],
      maxTemp: JsonData['maxtemp_c'],
      minTemp: JsonData['mintemp_c'],
      temp: JsonData['avgtemp_c'],
    );
  }

  @override
  String toString() {
    return 'temp = $temp -- maxTemp =$maxTemp -- minTemp = $minTemp -- date = $date';
  }
}


    // date = Data['location']['localtime'];
    // WeatherStateName = JsonData['condition']['text'];
    // maxTemp = JsonData['maxtemp_c'];
    // minTemp = JsonData['mintemp_c'];
    // temp = JsonData['avgtemp_c'];


// we used factory
// due to remove nullable signs '?' from variables 
// that could make a errors in future.