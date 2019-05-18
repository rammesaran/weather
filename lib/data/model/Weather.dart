import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstrom,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unkown
}

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastupdated;
  final String location;

  Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastupdated,
    this.location,
  }) : super([
          condition,
          formattedCondition,
          minTemp,
          temp,
          maxTemp,
          locationId,
          created,
          lastupdated,
          location
        ]);

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated'][0];
    return Weather(
      condition: _mapStringToWeatherCondition(
          consolidatedWeather['weather_state_abbr']),
      formattedCondition: consolidatedWeather['Weather_State_name'],
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      temp: consolidatedWeather['the_temp'] as double,
      locationId: json['woeid'] as int,
      created: consolidatedWeather['created'],
      lastupdated: DateTime.now(),
      location: json['title'],
    );
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;

    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;

      case 'sl':
        state = WeatherCondition.sleet;
        break;

      case 'h':
        state = WeatherCondition.hail;
        break;

      case 't':
        state = WeatherCondition.thunderstrom;
        break;

      case 'hr':
        state = WeatherCondition.heavyRain;
        break;

      case 'lr':
        state = WeatherCondition.lightRain;
        break;

      case 's':
        state = WeatherCondition.showers;
        break;

      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unkown;
    }
    return state;
  }
}
