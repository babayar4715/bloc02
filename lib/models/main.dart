// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
  });
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;

  factory Main.fromJson(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feelsLike: map['feels_lLike'] as num,
      tempMin: map['temp_min'] as num,
      tempMax: map['temp_max'] as num,
    );
  }
}
