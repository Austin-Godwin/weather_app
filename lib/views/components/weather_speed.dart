import 'package:flutter/material.dart';

class WeatherSpeed extends StatelessWidget {
  final IconData icon;
  final String basicUnit;
  final String type;
  const WeatherSpeed({
    Key? key,
    required this.icon,
    required this.basicUnit,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          boxShadow: const [BoxShadow(offset: Offset(2, 2))],
          // Color(0xFF000000).withOpacity(0.6),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Icon(
            icon,
            // Icons.access_alarm_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            basicUnit,
            // "9km/h",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            type,
            // "Wind",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
