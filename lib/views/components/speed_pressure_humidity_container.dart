import 'package:flutter/material.dart';
import 'weather_speed.dart';

class SpeedPressureHumidityContainer extends StatelessWidget {
  final String speed;
  final String humidity;
  final String pressure;
  const SpeedPressureHumidityContainer({
    Key? key,
    required this.speed,
    required this.humidity,
    required this.pressure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          // Color(0xFF000000).withOpacity(0.6),
          // boxShadow: const [BoxShadow(offset: Offset(2, 2))],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SpeedHumidityPressureCard(
              icon: Icons.speed_rounded, basicUnit: speed, type: "Speed"),
          SpeedHumidityPressureCard(
              icon: Icons.percent_rounded,
              basicUnit: humidity,
              type: "humidity"),
          SpeedHumidityPressureCard(
              icon: Icons.bar_chart_rounded,
              basicUnit: pressure,
              type: "pressure"),
        ],
      ),
    );
  }
}
