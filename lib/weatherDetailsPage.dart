import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_demo_app_code/model/weatherData.dart';

class WeatherDetailsPage extends StatefulWidget {
  static const String id = '/weatherDetailsPage';

  @override
  _WeatherDetailsPageState createState() => _WeatherDetailsPageState();
}

class _WeatherDetailsPageState extends State<WeatherDetailsPage> {
  List<String> units = [
    'C',
    'F',
  ];

  var selectedCurrency = 'C';

  @override
  Widget build(BuildContext context) {
    WeatherData weatherData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 100,
                  ),
                  child: Column(
                    children: [
                      Text(
                        weatherData.name,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_sunny_outlined,
                            size: 90,
                            color: Colors.blue,
                          ),
                          Column(
                            children: [
                              Text(
                                '${weatherData.temperature}°$selectedCurrency',
                                style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${weatherData.minTemperature}° / ${weatherData.maxTemperature}° Feels like ${weatherData.feelTemperature}°',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${weatherData.main}',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${weatherData.description}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightBlue,
                  child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in units) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in units) {
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = units[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }
}
