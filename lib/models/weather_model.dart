// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class WeatherModel {
  String name;
  String IconImage;
  String last_updated;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String WeatherStateName;

  WeatherModel({
    required this.name,
    required this.IconImage,
    required this.last_updated,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.WeatherStateName,
  });

  factory WeatherModel.fromJson(dynamic Data) {
    var JsonData = Data['forecast']['forecastday'][0]['day'];
    // print(Data);
    return WeatherModel(
      last_updated: Data['current']['last_updated'],
      name: Data['location']['name'],
      WeatherStateName: JsonData['condition']['text'],
      IconImage: Data['current']['condition']['icon'],
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

  // if i want use weather state assets
  // String getImage() {
  //   if (WeatherStateName == 'Clear') {
  //     return 'assets/images/clear.png';
  //   }
  // }

  // String getImage() {
  //   if (WeatherStateName == 'Sunny' ||
  //       WeatherStateName == 'Clear' ||
  //       WeatherStateName == 'partly cloudy') {
  //     return 'assets/images/clear.png';
  //   } else if (WeatherStateName == 'Blizzard' ||
  //       WeatherStateName == 'Patchy snow possible' ||
  //       WeatherStateName == 'Patchy sleet possible' ||
  //       WeatherStateName == 'Patchy freezing drizzle possible' ||
  //       WeatherStateName == 'Blowing snow') {
  //     return 'assets/images/snow.png';
  //   } else if (WeatherStateName == 'Freezing fog' ||
  //       WeatherStateName == 'Fog' ||
  //       WeatherStateName == 'Heavy Cloud' ||
  //       WeatherStateName == 'Mist' ||
  //       WeatherStateName == 'Fog') {
  //     return 'assets/images/cloudy.png';
  //   } else if (WeatherStateName == 'Patchy rain possible' ||
  //       WeatherStateName == 'Heavy Rain' ||
  //       WeatherStateName == 'Showers	') {
  //     return 'assets/images/rainy.png';
  //   } else if (WeatherStateName == 'Thundery outbreaks possible' ||
  //       WeatherStateName == 'Moderate or heavy snow with thunder' ||
  //       WeatherStateName == 'Patchy light snow with thunder' ||
  //       WeatherStateName == 'Moderate or heavy rain with thunder' ||
  //       WeatherStateName == 'Patchy light rain with thunder') {
  //     return 'assets/images/thunderstorm.png';
  //   } else {
  //     return 'assets/images/clear.png';
  //   }
  // }

  MaterialColor getThemeColor() {
    if (WeatherStateName == 'Sunny' ||
        WeatherStateName == 'Clear' ||
        WeatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (WeatherStateName == 'Blizzard' ||
        WeatherStateName == 'Patchy snow possible' ||
        WeatherStateName == 'Patchy sleet possible' ||
        WeatherStateName == 'Patchy freezing drizzle possible' ||
        WeatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (WeatherStateName == 'Freezing fog' ||
        WeatherStateName == 'Fog' ||
        WeatherStateName == 'Heavy Cloud' ||
        WeatherStateName == 'Mist' ||
        WeatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (WeatherStateName == 'Patchy rain possible' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (WeatherStateName == 'Thundery outbreaks possible' ||
        WeatherStateName == 'Moderate or heavy snow with thunder' ||
        WeatherStateName == 'Patchy light snow with thunder' ||
        WeatherStateName == 'Moderate or heavy rain with thunder' ||
        WeatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
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