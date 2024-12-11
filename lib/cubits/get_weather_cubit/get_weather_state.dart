import 'package:weather_app/model/weather_model.dart';

class WeatherState {}

//initialstate
class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailuerState extends WeatherState {}
