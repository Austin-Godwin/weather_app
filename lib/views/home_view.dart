import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tomel_weather_app/utils/all_methods.dart';
import 'package:tomel_weather_app/views/components/weather_card.dart';
import 'package:tomel_weather_app/views/components/weather_speed.dart';

import '../services/weather_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final AllMethods _methods = AllMethods();
  TextEditingController citySearchController = TextEditingController();
  int selectedIndex = 0;
  bool isLoading = false;
  final WeatherService _weatherService = WeatherService();

  Map<String, dynamic> weatherData = {};
  List<Map<String, dynamic>> weatherDataTime = [];
  List<Map<String, dynamic>> weatherDataDays = [];
  final String defaultcity = "lagos";

  getCurrentWeather(String? city) async {
    // print("I'm here");
    setState(() {
      isLoading = true;
    });
    weatherData =
        await _weatherService.getCurrentWeather(city: city ??= defaultcity);
    // print("======Weather Data========");
    // print(weatherData);
    setState(() {
      isLoading = false;
    });
  }

  getCurrentWeatherTime(String? city) async {
    setState(() {
      isLoading = true;
    });
    // print("I'm here");
    weatherDataTime =
        await _weatherService.getCurrentWeatherTime(city: city ??= defaultcity);
    // print("======Weather Data Time========");
    // print(weatherDataTime);
    setState(() {
      isLoading = false;
    });
  }

  getWeatherDays(String? city) async {
    setState(() {
      isLoading = true;
    });
    // print("I'm here");
    weatherDataDays =
        await _weatherService.getWeatherDays(city: city ??= defaultcity);
    // print("======Weather Data Time========");
    // print(weatherDataDays);
    setState(() {
      isLoading = false;
    });
  }

  toSetState() {
    getCurrentWeather(citySearchController.text);
    getCurrentWeatherTime(citySearchController.text);
    getWeatherDays(citySearchController.text);
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => toSetState(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      // backgroundColor: Color(0xFFF0E7FE),
      body: SafeArea(
        child: weatherData.isEmpty ||
                weatherDataTime.isEmpty ||
                weatherDataDays.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          weatherData["name"],
                          // "San Fransisco",
                          style: const TextStyle(
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
                        // const Spacer(),
                        IconButton(
                          onPressed: () async {
                            return showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      backgroundColor: const Color(0xFF343434),
                                      title: const Text(
                                        "please enter a valid location",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Container(
                                        width: 50,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.2),
                                          // boxShadow: const [
                                          //   BoxShadow(offset: Offset(2, 2))
                                          // ],
                                        ),
                                        child: TextFormField(
                                          controller: citySearchController,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                          maxLines: 2,
                                          // maxLength: 34,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              getCurrentWeather(
                                                  citySearchController.text);
                                              getCurrentWeatherTime(
                                                  citySearchController.text);
                                              getWeatherDays(
                                                  citySearchController.text);
                                            });
                                          },
                                          child: const Text(
                                            "SEARCH",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "CANCEL",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          iconSize: 30.0,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
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
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 90),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              // width: 180,
                              // height: 40,
                              constraints: const BoxConstraints(maxWidth: 10),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(offset: Offset(2, 2))
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey.withOpacity(0.2),
                                // Color(0xFF000000).withOpacity(0.6),
                              ),
                              child: Text(
                                DateFormat("EEEE, MMMM dd, yyyy").format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weatherData["dt"] * 1000)),
                                // "Monday, May 27, 2022",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  // right: 10,
                                  // left: 10,
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    constraints: const BoxConstraints(
                                        maxWidth: 450.0, maxHeight: 450),
                                    child: Image.asset(
                                        "assets/images/thunder_rain.png"),
                                  ),
                                ),
                                Positioned(
                                  top: 30,
                                  child: Text(
                                    weatherData["weather"][0]["description"],
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
                                    "${(weatherData["main"]["temp"] - 273).truncate()}°",
                                    // "38°",
                                    style: const TextStyle(
                                        fontSize: 100,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(2, 2),
                                          )
                                        ]

                                        // Color(0xFF636364).withOpacity(0.9),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 10.0),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  // Color(0xFF000000).withOpacity(0.6),
                                  // boxShadow: const [BoxShadow(offset: Offset(2, 2))],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  WeatherSpeed(
                                      icon: Icons.speed_rounded,
                                      basicUnit:
                                          "${(weatherData["wind"]["speed"])}km/h",
                                      type: "Speed"),
                                  WeatherSpeed(
                                      icon: Icons.percent_rounded,
                                      basicUnit:
                                          "${(weatherData["main"]["humidity"])}%",
                                      type: "humidity"),
                                  WeatherSpeed(
                                      icon: Icons.bar_chart_rounded,
                                      basicUnit:
                                          "${((weatherData["main"]["pressure"]) / 1013 * 760).truncate()}mmhg",
                                      type: "pressure"),
                                ],
                              ),
                            ),
                            WeatherCards(
                              timeList: weatherDataTime,
                              daysList: weatherDataDays,
                            ),
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
