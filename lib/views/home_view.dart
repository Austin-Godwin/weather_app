import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tomel_weather_app/constant/colors.dart';
import 'package:tomel_weather_app/utils/all_methods.dart';
import 'package:tomel_weather_app/views/components/current_day.dart';
import 'package:tomel_weather_app/views/components/current_weather_details.dart';
import 'package:tomel_weather_app/views/components/speed_pressure_humidity_container.dart';
import 'package:tomel_weather_app/views/components/weather_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AllMethods _methods = AllMethods();
  TextEditingController citySearchController = TextEditingController();

  @override
  void dispose() {
    citySearchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _methods.getCurrentWeather(
            city: citySearchController.text,
            toSetState: () {
              setState(() {});
            });
        _methods.getCurrentWeatherTime(
            city: citySearchController.text,
            toSetState: () {
              setState(() {});
            });
        _methods.getWeatherDays(
            city: citySearchController.text,
            toSetState: () {
              setState(() {});
            });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF343434),
      // backgroundColor: Color(0xFFF0E7FE),
      body: SafeArea(
        child: _methods.weatherData.isEmpty ||
                _methods.weatherDataTime.isEmpty ||
                _methods.weatherDataDays.isEmpty
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
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              _methods.weatherData["name"],
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
                          ],
                        ),

                        ///Displays a dialog for user to search for city location
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
                                              _methods.getCurrentWeather(
                                                  city:
                                                      citySearchController.text,
                                                  toSetState: () {
                                                    setState(() {});
                                                  });
                                              _methods.getCurrentWeatherTime(
                                                  city:
                                                      citySearchController.text,
                                                  toSetState: () {
                                                    setState(() {});
                                                  });
                                              _methods.getWeatherDays(
                                                  city:
                                                      citySearchController.text,
                                                  toSetState: () {
                                                    setState(() {});
                                                  });
                                              citySearchController.clear();
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
                                            citySearchController.clear();
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
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

                            ///Displays the current day in a container.
                            CurrentDay(
                              currentDate: DateFormat("EEEE, MMMM dd, yyyy")
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      _methods.weatherData["dt"] * 1000)),
                            ),

                            ///Displays the image, current weather description and temperature
                            CurrentWeatherDetails(
                              imageUrl: _methods.weatherData["weather"][0]
                                  ["main"],
                              // "assets/images/thunder_rain.png",
                              weatherDescription: _methods
                                  .weatherData["weather"][0]["description"],
                              temprature:
                                  "${(_methods.weatherData["main"]["temp"] - 273).truncate()}°",
                            ),

                            ///Dispalys the speed, humidity and pressure of the current weather
                            SpeedPressureHumidityContainer(
                              speed:
                                  "${(_methods.weatherData["wind"]["speed"])}km/h",
                              humidity:
                                  "${(_methods.weatherData["main"]["humidity"])}%",
                              pressure:
                                  "${((_methods.weatherData["main"]["pressure"]) / 1013 * 760).truncate()}mmhg",
                            ),

                            /// Displays, the current weather time intervals and also resposible for the next days when the
                            /// next 7 days button is clicked.
                            WeatherCards(
                              timeList: _methods.weatherDataTime,
                              daysList: _methods.weatherDataDays,
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
