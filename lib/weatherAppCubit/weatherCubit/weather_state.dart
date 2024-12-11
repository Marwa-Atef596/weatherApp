import 'package:weather_app/model/weather_model.dart';

abstract class WeatherStates {}

class initailstate extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherSuccess extends WeatherStates {
  WeatherModel weatherModel;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherStates {}
