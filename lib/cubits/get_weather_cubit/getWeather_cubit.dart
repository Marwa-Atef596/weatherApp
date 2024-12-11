// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import '../../model/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
   WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());
  getWeather({required String cityName}) async {
    //الكيوبت هيكلم ال ui
    try {
      // ignore: unused_local_variable
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailuerState());
    }
  }
}
