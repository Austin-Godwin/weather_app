import 'package:flutter/material.dart';
import 'package:tomel_weather_app/services/weather_service.dart';

import '../constant/api.dart';

class AllMethods {
  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic> weatherData = {};
  List<Map<String, dynamic>> weatherDataTime = [];
  List<Map<String, dynamic>> weatherDataDays = [];
  final String defaultcity = "lagos";
  bool isLoading = false;

  // initializeMethods({String? city, Function()? toSetState}) {
  //   getCurrentWeather(city: city, toSetState: toSetState!());
  //   getCurrentWeatherTime(city: city, toSetState: toSetState());
  //   getWeatherDays(city: city, toSetState: toSetState());
  // }

  getCurrentWeather(
      {required String city, required Function() toSetState}) async {
    // isLoading = true;
    toSetState();

    // print("I'm here");
    weatherData = await _weatherService.getCurrentWeather(
        city: city.isEmpty ? defaultcity : city);
    // print("======Weather Data========");
    // print(weatherData);
    // isLoading = false;
    toSetState();
    // toSetState();
  }

  getCurrentWeatherTime(
      {required String city, required Function() toSetState}) async {
    //  isLoading = true;
    toSetState();
    // print("I'm here");
    weatherDataTime = await _weatherService.getCurrentWeatherTime(
        city: city.isEmpty ? defaultcity : city);
    // print("======Weather Data Time========");
    // print(weatherDataTime);
    // isLoading = false;
    toSetState();
  }

  getWeatherDays({required String city, required Function() toSetState}) async {
    // isLoading = true;
    toSetState();
    // print("I'm here");
    weatherDataDays = await _weatherService.getWeatherDays(
        city: city.isEmpty ? defaultcity : city);
    // print("======Weather Data Time========");
    // print(weatherDataDays);
    //  isLoading = false;
    toSetState();
  }
}
