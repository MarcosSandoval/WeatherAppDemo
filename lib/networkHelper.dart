import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_demo_app_code/model/weatherData.dart';

class NetworkHelper {
  static const String apiKey = '2ceeebe3fc081c3ed9eeac94439f8d0d';

  Future<WeatherData> getCurrentWeatherByCity(
      String cityName, String units) async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=$units');
    return _manageResponse(await http.get(url));
  }

  Future<WeatherData> getCurrentWeatherByPosition(
      double lat, double long, String units) async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=$units');
    return _manageResponse(await http.get(url));
  }

  WeatherData _manageResponse(http.Response response) {
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return WeatherData.fromJson(decode);
    } else {}
    return null;
  }
}
