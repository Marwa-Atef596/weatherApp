import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/weatherAppCubit/weatherCubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit(this.weatherServices) : super(initailstate());
  WeatherService weatherServices;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel =
          await weatherServices.getCurrentWeather(city: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
