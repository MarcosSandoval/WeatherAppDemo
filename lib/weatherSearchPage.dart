import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_demo_app_code/weatherDetailsPage.dart';

class WeatherSearchDetails extends StatefulWidget {
  static const String id = '/weatherSearchDetails';

  @override
  _WeatherSearchDetailsState createState() => _WeatherSearchDetailsState();
}

class _WeatherSearchDetailsState extends State<WeatherSearchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    hintText: 'Enter a city name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 150,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      WeatherDetailsPage.id,
                    );
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
