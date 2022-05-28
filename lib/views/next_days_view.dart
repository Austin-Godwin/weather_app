import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tomel_weather_app/constant/colors.dart';
import 'package:tomel_weather_app/views/components/weather_image.dart';
import 'components/weather_speed.dart';

class NextDaysView extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  const NextDaysView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int currentIndex = 1;
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      // backgroundColor: Color(0xFFF0E7FE),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    iconSize: 20.0,
                  ),
                  const Text(
                    "Next 7 Days",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                        )
                      ],
                      // Color(0xFF4B4B4C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                // margin: const EdgeInsets.symmetric(horizontal: 30),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  colors: MyColors.gradientColor,
                )),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // Color(0xFF000000).withOpacity(0.6),
                            boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                MediumWeatherImage(
                                  weatherCondition:
                                      "${list[1]["weather"][0]["main"]}",
                                ),
                                // Container(
                                //   width: 150,
                                //   height: 150,
                                //   constraints: const BoxConstraints(
                                //       maxWidth: 450.0, maxHeight: 450),
                                //   child: Image.asset(
                                //       "assets/images/thunder_rain.png"),
                                // ),

                                //     Text(
                                //   _methods.weatherData["name"],
                                //   // "San Fransisco",
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 30,
                                //     color: Colors.white,
                                //     shadows: [
                                //       Shadow(
                                //         offset: Offset(2, 2),
                                //       )
                                //     ],
                                //     // Color(0xFF4B4B4C),
                                //   ),
                                // ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${((list[1]["temp"]["min"]) - 273).truncate()}",
                                      style: const TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "/${((list[1]["temp"]["max"]) - 273).truncate()}°",
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${list[1]["weather"][0]["description"]}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // Color(0xFF000000).withOpacity(0.6),
                            // boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SpeedHumidityPressureCard(
                              icon: Icons.speed_rounded,
                              basicUnit: "${list[1]["speed"]}km/h",
                              type: "speed",
                            ),
                            // SizedBox(
                            //   width: 40,
                            // ),
                            SpeedHumidityPressureCard(
                              icon: Icons.percent_rounded,
                              basicUnit: "${list[1]["humidity"]}%",
                              type: "humidity",
                            ),
                            SpeedHumidityPressureCard(
                              icon: Icons.bar_chart_rounded,
                              basicUnit:
                                  "${((list[1]["pressure"]) / 1013 * 763).truncate()}mmhg",
                              type: "pressure",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ...List.generate(
                        list.length,
                        ((index) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 20),
                                decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? Colors.amber.withOpacity(0.2)
                                        : Colors.grey.withOpacity(0.2),
                                    // Color(0xFF000000).withOpacity(0.6),
                                    boxShadow: const [
                                      BoxShadow(offset: Offset(2, 2))
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          DateFormat("EEEE").format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  list[index]["dt"] * 1000)),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          DateFormat("MMM, dd yyyy").format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      list[index]["dt"] *
                                                          1000)),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SmallWeatherImage(
                                              weatherCondition:
                                                  "${list[index]["weather"][0]["main"]}"),
                                          // SizedBox(
                                          //   height: 40,
                                          //   width: 40,
                                          //   child: Image.asset(
                                          //       "assets/images/rain_sun.png"),
                                          // ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "${list[index]["weather"][0]["description"]}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "${((list[index]["temp"]["min"]) - 273).truncate()}/${((list[index]["temp"]["max"]) - 273).truncate()}°",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
