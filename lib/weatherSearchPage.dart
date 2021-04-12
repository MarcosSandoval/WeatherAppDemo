import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_demo_app_code/networkHelper.dart';
import 'package:weather_demo_app_code/weatherDetailsPage.dart';

class WeatherSearchPage extends StatefulWidget {
  static const String id = '/weatherSearchDetails';

  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

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
                  controller: myController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await Geolocator.requestPermission();
                        var position = await Geolocator.getCurrentPosition();
                        NetworkHelper()
                            .getCurrentWeatherByPosition(
                                position.latitude, position.longitude, 'metric')
                            .then((value) => {
                                  Navigator.pushNamed(
                                    context,
                                    WeatherDetailsPage.id,
                                    arguments: value,
                                  )
                                });
                        var x = '';
                      },
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
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 150,
                    ),
                  ),
                  onPressed: () async {
                    var networkHelper = NetworkHelper();
                    var weatherData = await networkHelper
                        .getCurrentWeatherByCity(myController.text, 'metric');
                    Navigator.pushNamed(
                      context,
                      WeatherDetailsPage.id,
                      arguments: weatherData,
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
