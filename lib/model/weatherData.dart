class WeatherData {
  final String name;
  final String main;
  final String description;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double feelTemperature;

  WeatherData(this.name, this.main, this.description, this.temperature,
      this.minTemperature, this.maxTemperature, this.feelTemperature);

  WeatherData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        main = json['weather'][0]['main'],
        description = json['weather'][0]['description'],
        temperature = json['main']['temp'],
        minTemperature = json['main']['temp_min'],
        maxTemperature = json['main']['temp_max'],
        feelTemperature = json['main']['feels_like'];
}
