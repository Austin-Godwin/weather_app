import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://community-open-weather-map.p.rapidapi.com/weather?q=benin"),
        headers: {
          "X-RapidAPI-Host": "community-open-weather-map.p.rapidapi.com",
          "X-RapidAPI-Key":
              "5dc59fbc26mshf5b4499c224e0dcp12ce36jsndbd5ebd2d203",
        },
      );
      // print("========Response Body=======");
      // print(response.body);
      final data = jsonDecode(response.body);
      // print("========Data=======");
      // print(data);
      // List weatherResult = await data.map((e) => e[""]);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCurrentWeatherTime() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://community-open-weather-map.p.rapidapi.com/forecast?q=benin"),
        headers: {
          'X-RapidAPI-Host': 'community-open-weather-map.p.rapidapi.com',
          'X-RapidAPI-Key': '5dc59fbc26mshf5b4499c224e0dcp12ce36jsndbd5ebd2d203'
        },
      );
      print("========Response Body=======");
      print(response.body);
      final data = jsonDecode(response.body)["list"];
      print("========Data=======");
      print(data);
      final List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      print("========Result=======");
      print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
