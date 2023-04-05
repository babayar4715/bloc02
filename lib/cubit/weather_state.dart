part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSucces extends WeatherState {
  const WeatherSucces(this.weatherResponse);

  final WeatherResponse weatherResponse;
}

class WeatherError extends WeatherState {
  const WeatherError(this.errorText);

  final String errorText;
}
