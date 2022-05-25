import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tomel_weather_app/views/components/weather_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0E7FE),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("San Fransisco")],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Stack(
                // fit: StackFit.passthrough,
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 10,
                    right: 60,
                    left: 60,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const SweepGradient(colors: [
                          Color(0xFFE654BE),
                          Color(0xFFCD4DDC),
                          Color(0xFFF1C5D8),
                          Color(0xFFB327E9),
                          Color(0xFFE69DBA),
                        ]),
                        // boxShadow: [
                        //   BoxShadow(
                        //       offset: Offset(10, 10),
                        //       blurRadius: 10,
                        //       color: Color(0xFFE654BE))
                        // ],
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 50),
                        child: Center(
                          child: Text(
                            "me",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    right: 130,
                    child: Container(
                      // width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 150.0,
                    child: Container(
                        width: 280,
                        // constraints: BoxConstraints(maxWidth: 450.0),
                        child: Image.asset("assets/images/sun_and_cloud.png")),
                  ),
                  // WeatherCards(),
                  Positioned(
                    // bottom: -70,
                    top: 410,
                    right: 30,
                    left: 30,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 30),
                          decoration: BoxDecoration(
                              color: Color(0xFFFDFDFF),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: const [
                                  Icon(
                                    Icons.access_alarm_outlined,
                                    color: Color(0xFF7349FD),
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "9km/h",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFF7E7B7B)),
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   width: 40,
                              // ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.access_alarm_outlined,
                                    color: Color(0xFF7349FD),
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "9km/h",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFD6D5E1)),
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   width: 40,
                              // ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.access_alarm_outlined,
                                    color: Color(0xFF7349FD),
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "9km/h",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "Wind",
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFD6D5E1)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // WeatherCards()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     shrinkWrap: true,
        //     itemCount: 10,
        //     itemBuilder: (context, index) => Container(
        //       // width: 50,
        //       // height: 20,
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
        //       margin: const EdgeInsets.only(left: 15.0),
        //       decoration: BoxDecoration(
        //           color: const Color(0xFFFDFDFF),
        //           borderRadius: BorderRadius.circular(20)),
        //       child: Column(
        //         children: const [
        //           Icon(
        //             Icons.access_alarm_outlined,
        //             color: Color(0xFF7349FD),
        //             size: 30.0,
        //           ),
        //           SizedBox(
        //             height: 15,
        //           ),
        //           Text(
        //             "9km/h",
        //             style: TextStyle(fontSize: 18),
        //           ),
        //           Text(
        //             "Wind",
        //             style: TextStyle(fontSize: 15, color: Color(0xFFD6D5E1)),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
          ],
        ),
      ),
    );
  }
}
