import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:weatherapp/Repository/WeatherRepository.dart';
import 'package:weatherapp/data/model/Weather.dart';
import 'package:weatherapp/data/provider/WeatherApiClient.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(App(weatherRepository: weatherRepository));
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter weather',
      home: Weather(
        weatherRepository: weatherRepository,
      ),
    );
  }
}
