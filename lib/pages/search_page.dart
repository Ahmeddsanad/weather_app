import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.UpdateUI});

  String? CityName;
  VoidCallback? UpdateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        elevation: 0.0,
        title: const Text(
          'Search a city',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 18.0,
                ),
                hintText: 'Enter a city',
                labelText: 'Search',
                suffix: const Icon(
                  Icons.search_rounded,
                  size: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
              ),
              // onChanged: (value) {
              //   print(value);
              // },

              onSubmitted: (value) async {
                CityName = value;

                WeatherService service = WeatherService();

                WeatherModel weather = await service.getWeather(
                  CityName: CityName!,
                );
                Provider.of<WeatherProvider>(context, listen: false)
                    .WeatherData = weather;
                Navigator.pop(context);
                // print(weather);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// WeatherModel? weatherData;
// من عيوبه ان انا لو مثلا عايز 
// passing data from screen to screen to screen to screen to .....
// ف انا هحتاج اباصي الداتا من سكرين ل تانيه وهكذا ودا طبعا مش احسن حاجة
//


// Widget TextFormFieldByMe() => TextFormField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             8.0,
//           ),
//         ),
//         label: Text('Search'),
//       ),
//     );


// onSubmitted: (value) async {
//                 await Future.delayed(const Duration(seconds: 5), () {
//                   print(
//                       'delayed 5 seconds'); //used in splash screen Future.delayed
//                 });
//                 print(value);
//                 // CityName = value;
//               },