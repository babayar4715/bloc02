import 'package:bloc02/models/weather_response.dart';
import 'package:bloc02/services/fetch_sevice.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  final WeatherService weatherService;

  Future<void> getWeatherByCityName(String cityName) async {
    emit(WeatherLoading());
    final data = await weatherService.getWeatherByCityName(cityName);
    if (data != null) {
      emit(WeatherSucces(data));
    } else {
      emit(const WeatherError('bir kata boldu'));
    }
  }
}
