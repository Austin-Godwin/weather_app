import 'dart:ui';
import 'package:flutter/material.dart';
import 'components/weather_speed.dart';

class NextDaysView extends StatelessWidget {
  const NextDaysView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "Next Days",
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
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                  colors: [
                    Color(0xFF343434),
                    Color(0xFF343434),

                    Color(0xFF343434),
                    Color(0xFF343434),

                    Color(0xFF343434),
                    Color(0xFF343434),

                    // Color(0xFF000000),
                    // Color(0xFF000000)
                  ],
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
                            Container(
                              width: 150,
                              height: 150,
                              constraints: const BoxConstraints(
                                  maxWidth: 450.0, maxHeight: 450),
                              child:
                                  Image.asset("assets/images/thunder_rain.png"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tomorrow",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    // shadows: [
                                    //   Shadow(
                                    //     offset: Offset(2, 2),
                                    //   )
                                    // ]
                                    // Color(0xFF636364).withOpacity(0.9),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "25",
                                      style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        // shadows: [
                                        //   Shadow(
                                        //     offset: Offset(2, 2),
                                        //   )
                                        // ]
                                        // Color(0xFF636364).withOpacity(0.9),
                                      ),
                                    ),
                                    Text(
                                      "/27°",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        // shadows: [
                                        //   Shadow(
                                        //     offset: Offset(2, 2),
                                        //   )
                                        // ]
                                        // Color(0xFF636364).withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Rain - cloudy",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    // shadows: [
                                    //   Shadow(
                                    //     offset: Offset(2, 2),
                                    //   )
                                    // ]
                                    // Color(0xFF636364).withOpacity(0.9),
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
                            horizontal: 15.0, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            // Color(0xFF000000).withOpacity(0.6),
                            // boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            WeatherSpeed(
                              basicUnit: "50",
                              type: "type",
                              icon: Icons.accessibility_new_sharp,
                            ),
                            // SizedBox(
                            //   width: 40,
                            // ),
                            WeatherSpeed(
                              basicUnit: "68",
                              type: "type",
                              icon: Icons.abc_sharp,
                            ),
                            WeatherSpeed(
                              basicUnit: "30",
                              type: "type",
                              icon: Icons.accessible_forward_rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ...List.generate(
                        7,
                        ((index) => Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 20),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    // Color(0xFF000000).withOpacity(0.6),
                                    boxShadow: const [
                                      BoxShadow(offset: Offset(2, 2))
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Mon",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        // shadows: [
                                        //   Shadow(
                                        //     offset: Offset(2, 2),
                                        //   )
                                        // ]
                                        // Color(0xFF636364).withOpacity(0.9),
                                      ),
                                    ),
                                    Container(
                                      // height: 40,
                                      // width: 40,
                                      // decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                "assets/images/rain_sun.png"),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          const Text(
                                            "Rainy",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              // fontWeight: FontWeight.bold,
                                              // shadows: [
                                              //   Shadow(
                                              //     offset: Offset(2, 2),
                                              //   )
                                              // ]
                                              // Color(0xFF636364).withOpacity(0.9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      "17/15",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        // fontWeight: FontWeight.bold,
                                        // shadows: [
                                        //   Shadow(
                                        //     offset: Offset(2, 2),
                                        //   )
                                        // ]
                                        // Color(0xFF636364).withOpacity(0.9),
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
