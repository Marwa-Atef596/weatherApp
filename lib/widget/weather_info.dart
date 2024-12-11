import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weathermodell});
  final WeatherModel weathermodell;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    WeatherModel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColor(weathermodel.statues),
          getColor(weathermodel.statues)[300]!,
          getColor(weathermodel.statues)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityName,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "update at ${weathermodel.date.hour}:${weathermodel.date.minute}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: NetworkImage(
                    'https:${weathermodel.image}',
                  ),
                ),
                Text(
                  weathermodel.avgtemp.round().toString(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp:${weathermodel.maxtemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Mintemp:${weathermodel.mintemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel.statues,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
