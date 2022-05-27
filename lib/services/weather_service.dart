import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tomel_weather_app/constant/api.dart';

class WeatherService {
  Future<Map<String, dynamic>> getCurrentWeather({required String city}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("${Api.baseUrl}/weather?q=$city"),
        headers: {
          Api.apiHost: Api.apiHostValue,
          Api.apiKey: Api.apiKeyValue,
        },
      );
      // print("========Response Body=======");
      // print(response.body);
      var data = jsonDecode(response.body);
      // print("========Data=======");
      // print(data);
      // List weatherResult = await data.map((e) => e[""]);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCurrentWeatherTime(
      {required String city}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("${Api.baseUrl}/forecast?q=$city"),
        headers: {
          Api.apiHost: Api.apiHostValue,
          Api.apiKey: Api.apiKeyValue,
        },
      );
      // print("========Response Body=======");
      // print(response.body);
      var data = jsonDecode(response.body)["list"];
      // print("========Data=======");
      // print(data);
      final List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      // print("========Result=======");
      // print(result);
      return result;
    } catch (e) {
      // print("The error is: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getWeatherDays(
      {required String city}) async {
    try {
      http.Response response = await http.get(
        Uri.parse("${Api.baseUrl}/forecast/daily?q=$city"),
        headers: {
          Api.apiHost: Api.apiHostValue,
          Api.apiKey: Api.apiKeyValue,
        },
      );
      // print(response.body);
      var data = jsonDecode(response.body)["list"];
      // print("========Data=======");
      print(data);
      final List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(data.map((e) => e));
      // print("========Result=======");
      // print(result);
      return result;
    } catch (e) {
      // print("The error is: $e");
      rethrow;
    }
  }
}
