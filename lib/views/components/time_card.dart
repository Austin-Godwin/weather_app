import 'package:flutter/material.dart';
import 'package:tomel_weather_app/views/components/weather_image.dart';

class TimeCard extends StatelessWidget {
  final String temperature;
  final String time;
  final Color? cardColor;
  final String imageUrl;
  // final Function()? onTap;
  const TimeCard({
    Key? key,
    required this.temperature,
    required this.time,
    this.cardColor,
    required this.imageUrl,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        // onTap: onTap,
        child: Container(
          width: 100,
          // height: 20,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          margin: const EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(offset: Offset(2, 2))],
              color: cardColor,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              // Icon(
              //   Icons.access_alarm_outlined,
              //   color: Colors.white,
              //   size: 30.0,
              // ),
              Text(
                temperature,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              SmallWeatherImage(weatherCondition: imageUrl),
              // SizedBox(
              //   height: 40,
              //   width: 40,
              //   // decoration: BoxDecoration(),
              //   child: Image.asset("assets/images/rain_sun.png"),
              // ),

              Text(
                time,
                style: const TextStyle(fontSize: 15, color: Color(0xFF7E7B7B)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
