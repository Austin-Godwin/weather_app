import 'package:flutter/material.dart';
import 'package:tomel_weather_app/services/weather_service.dart';

import '../constant/api.dart';

class AllMethods {
  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic> weatherData = {};
  List<Map<String, dynamic>> weatherDataTime = [];
  List<Map<String, dynamic>> weatherDataDays = [];
  final String defaultcity = "lagos";

  getCurrentWeather(String? city) async {
    // print("I'm here");
    weatherData =
        await _weatherService.getCurrentWeather(city: city ??= defaultcity);
    // print("======Weather Data========");
    // print(weatherData);
  }

  getCurrentWeatherTime(String? city) async {
    // print("I'm here");
    weatherDataTime =
        await _weatherService.getCurrentWeatherTime(city: city ??= defaultcity);
    // print("======Weather Data Time========");
    // print(weatherDataTime);
  }

  getWeatherDays(String? city) async {
    // print("I'm here");
    weatherDataDays =
        await _weatherService.getWeatherDays(city: city ??= defaultcity);
    // print("======Weather Data Time========");
    // print(weatherDataDays);
  }
}
