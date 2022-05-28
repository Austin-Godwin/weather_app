import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tomel_weather_app/views/components/time_card.dart';
import 'package:tomel_weather_app/views/next_days_view.dart';

class WeatherCards extends StatelessWidget {
  final List<Map<String, dynamic>> timeList;
  final List<Map<String, dynamic>> daysList;
  // final Function()? onTap;
  WeatherCards({
    Key? key,
    required this.timeList,
    required this.daysList,
    // required this.onTap,
  }) : super(key: key);
  String currentTime = DateFormat("h:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    String currentTime = DateFormat("h:mm a").format(DateTime.now());
    // padding: EdgeInsets.symmetric(horizontal: 30),
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(
                  fontSize: 22, color: Colors.white,
                  // Color(
                  //   0xFF4B4B4C,
                  // ),
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                ),
                child: InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextDaysView(
                                  list: daysList,
                                )));
                  }),
                  child: Row(
                    children: const [
                      Text(
                        "Next 7 Days",
                        style: TextStyle(fontSize: 15, color: Colors.white
                            // Color(
                            //   0xFF4B4B4C,
                            // ),
                            ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                // const SizedBox(
                //   width: 15.0,
                // ),
                ...List.generate(
                    (timeList.length / 5).floor(),
                    (index) => TimeCard(
                        cardColor:
                            // currentTime ==
                            //         DateFormat("h:mm a").format(
                            //             DateTime.fromMillisecondsSinceEpoch(
                            //                 timeList[index]["dt"] * 1000))
                            //     ? Colors.amber.withOpacity(0.2)
                            //     : Colors.grey.withOpacity(0.2),
                            currentIndex == index
                                ? Colors.amber.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.2),
                        // onTap: onTap,
                        imageUrl: "${timeList[index]["weather"][0]["main"]}",
                        temperature:
                            "${((timeList[index]["main"]["temp"]) - 273).truncate()}°",
                        time: DateFormat("h:mm a").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                timeList[index]["dt"] * 1000)))),
                // const SizedBox(
                //   width: 30.0,
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
