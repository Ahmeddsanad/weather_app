import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? WeatherData =
        Provider.of<WeatherProvider>(context).WeatherData;

    var Date = WeatherData?.date.split(' ');

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
          ),
        ],
      ),
      body: WeatherData == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    WeatherData.name,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Last Updated : ${Date![1]}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 75.0,
                          height: 75.0,
                          child: Image(
                            image: NetworkImage(
                              'https:${WeatherData.IconImage}',
                              scale: 0.5,
                            ),
                          )
                          // child: Image.asset('assets/images/thunderstorm.png'),
                          ),
                      Text(
                        '${WeatherData.temp.toInt()}°',
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('min temp: ${WeatherData.minTemp.toInt()}°'),
                          Text('max temp: ${WeatherData.maxTemp.toInt()}°'),
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    WeatherData.WeatherStateName,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  WeatherData.getThemeColor(),
                  WeatherData.getThemeColor()[300]!,
                  WeatherData.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
    );
  }
}


// MaterialColor contain a list of colors 
// whereis the color contain one value of color
