import 'package:flutter/material.dart';
import 'package:tomel_weather_app/constant/image_path.dart';
import 'package:tomel_weather_app/constant/weather_condition_key.dart';

class LargeWeatherImage extends StatelessWidget {
  final String weatherCondition;
  const LargeWeatherImage({Key? key, required this.weatherCondition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      constraints: const BoxConstraints(maxWidth: 450.0, maxHeight: 450),
      child: Image.asset(
        weatherCondition == WeatherConditionKey.rainy
            ? ImagePath.rainy
            : weatherCondition == WeatherConditionKey.cloudy
                ? ImagePath.cloudy
                : weatherCondition == WeatherConditionKey.clear
                    ? ImagePath.clear
                    : ImagePath.stormy,
      ),
    );
  }
}

class SmallWeatherImage extends StatelessWidget {
  final String weatherCondition;
  const SmallWeatherImage({Key? key, required this.weatherCondition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      // constraints: const BoxConstraints(maxWidth: 450.0, maxHeight: 450),
      child: Image.asset(
        weatherCondition == WeatherConditionKey.rainy
            ? ImagePath.rainy
            : weatherCondition == WeatherConditionKey.cloudy
                ? ImagePath.cloudy
                : weatherCondition == WeatherConditionKey.clear
                    ? ImagePath.clear
                    : ImagePath.stormy,
      ),
    );
  }
}

class MediumWeatherImage extends StatelessWidget {
  final String weatherCondition;
  const MediumWeatherImage({Key? key, required this.weatherCondition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      constraints: const BoxConstraints(maxWidth: 450.0, maxHeight: 450),
      child: Image.asset(
        weatherCondition == WeatherConditionKey.rainy
            ? ImagePath.rainy
            : weatherCondition == WeatherConditionKey.cloudy
                ? ImagePath.cloudy
                : weatherCondition == WeatherConditionKey.clear
                    ? ImagePath.clear
                    : ImagePath.stormy,
      ),
    );
  }
}
