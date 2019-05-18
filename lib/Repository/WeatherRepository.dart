import 'package:meta/meta.dart';
import 'package:weatherapp/data/model/Weather.dart';
import 'package:weatherapp/data/provider/WeatherApiClient.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
