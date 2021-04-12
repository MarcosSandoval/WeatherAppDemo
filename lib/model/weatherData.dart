class WeatherData {
  final String name;
  final String main;
  final String description;
  final String temperature;
  final String minTemperature;
  final String maxTemperature;
  final String feelTemperature;

  WeatherData(this.name, this.main, this.description, this.temperature,
      this.minTemperature, this.maxTemperature, this.feelTemperature);

  WeatherData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        main = json['weather'][0]['main'],
        description = json['weather'][0]['description'],
        temperature = json['main']['temp'].toString(),
        minTemperature = json['main']['temp_min'].toString(),
        maxTemperature = json['main']['temp_max'].toString(),
        feelTemperature = json['main']['feels_like'].toString();
}
