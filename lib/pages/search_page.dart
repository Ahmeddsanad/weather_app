import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  String? CityName;
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

              onSubmitted: (value) {
                print(value);
                CityName = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
