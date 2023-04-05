import 'dart:math';

import 'package:bloc02/models/weather_response.dart';
import 'package:http/http.dart' as http;

import '../constants/api.dart';

class WeatherService {
  final client = http.Client();

  Future<WeatherResponse?> getWeatherByCityName(String cityName) async {
    final uri = Uri.parse(
      ApiConst.weatherByCityName(cityName),
    );
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final weather = WeatherResponse.fromJson(response.body);
        return weather;
      } else {
        print('response.statusCode: ${response.statusCode}');
      }
    } catch (e) {
      print('error $e');
      return null;
    }
  }
}

final weatherService = WeatherService();
