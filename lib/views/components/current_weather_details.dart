import 'package:flutter/material.dart';
import 'package:tomel_weather_app/views/components/weather_image.dart';

class CurrentWeatherDetails extends StatelessWidget {
  final String imageUrl;
  final String weatherDescription;
  final String temprature;
  const CurrentWeatherDetails({
    Key? key,
    required this.imageUrl,
    required this.weatherDescription,
    required this.temprature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
            // right: 10,
            // left: 10,
            child: LargeWeatherImage(weatherCondition: imageUrl)
            // Container(
            //   width: 250,
            //   height: 250,
            //   constraints: const BoxConstraints(maxWidth: 450.0, maxHeight: 450),
            //   child: Image.asset(imageUrl),
            // ),
            ),
        Positioned(
          top: 30,
          child: Text(
            weatherDescription,
            // "Thunder Storm",
            style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                  )
                ]
                // Color(0xFF636364).withOpacity(0.9),
                ),
          ),
        ),
        Positioned(
          bottom: 40,
          child: Text(
            temprature,
            // "38°",
            style: const TextStyle(
              fontSize: 100,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
