// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:bloc02/models/weather.dart';

import 'main.dart';

class WeatherResponse {
  WeatherResponse({
    required this.weather,
    required this.main,
    required this.name,
  });
  final List<Weather> weather;
  final Main main;
  final String name;

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      weather: List<Weather>.from(
        (map['weather1'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
