import 'package:bloc02/cubit/weather_cubit.dart';
import 'package:bloc02/services/fetch_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(weatherService)..getWeatherByCityName('bishkek'),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<WeatherCubit>().getWeatherByCityName('bishkek');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('HomePage'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text('WeatherInitial');
            } else if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            } else if (state is WeatherSucces) {
              return const Text('WeatherSucces');
            } else if (state is WeatherError) {
              return const Text('WeatherError');
            } else {
              return const Text("Bilbedim");
            }
          },
        ),
      ),
    );
  }
}
