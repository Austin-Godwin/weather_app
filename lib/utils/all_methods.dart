import 'package:tomel_weather_app/services/weather_service.dart';

class AllMethods {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic> weatherData = {};
  List<Map<String, dynamic>> weatherDataTime = [];

  getCurrentWeather() async {
    print("I'm here");
    weatherData = await _weatherService.getCurrentWeather();
    print("======Weather Data========");
    print(weatherData);
  }

  getCurrentWeatherTime() async {
    print("I'm here");
    weatherDataTime = await _weatherService.getCurrentWeatherTime();
    print("======Weather Data Time========");
    print(weatherDataTime);
  }
}
