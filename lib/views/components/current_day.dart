import 'package:flutter/material.dart';

class CurrentDay extends StatelessWidget {
  final String currentDate;
  const CurrentDay({
    Key? key,
    required this.currentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 90),
      padding: const EdgeInsets.symmetric(vertical: 20),
      // width: 180,
      // height: 40,
      constraints: const BoxConstraints(maxWidth: 10),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(offset: Offset(2, 2))],
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(0.2),
        // Color(0xFF000000).withOpacity(0.6),
      ),
      child: Text(
        currentDate,
        // "Monday, May 27, 2022",
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
