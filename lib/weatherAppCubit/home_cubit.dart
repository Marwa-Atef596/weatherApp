import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/weatherAppCubit/search_cbit.dart';
import 'package:weather_app/weatherAppCubit/weatherCubit/weather_cubit.dart';
import 'package:weather_app/weatherAppCubit/weatherCubit/weather_state.dart';
import 'package:weather_app/widget/no_weather_body.dart';

import '../main.dart';


class HomePageCubit extends StatelessWidget {
   HomePageCubit({super.key});
  WeatherModel? weathermodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchViewCubit(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
          //  weathermodel = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessBody(weathermodel: state.weatherModel);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Oops there\'s error'),
            );
          } else if (state is initailstate) {
            return NoWeatherBody();
          }
          return Text("data");
        })
        //weatherModel==null? const NoWeatherBody():const WeatherInfoBody(),
        );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    this.weathermodel,
  });
  final WeatherModel? weathermodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getColor(weathermodel!.statues),
          getColor(weathermodel!.statues)[300]!,
          getColor(weathermodel!.statues)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              ""
              "update at ${weathermodel!.date.hour}:${weathermodel!.date.minute}",
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
                      'https:${weathermodel!.image}',
                      ),
                ),
                Text(
                  weathermodel!.avgtemp.round().toString(),
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp:${weathermodel!.maxtemp.round()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(""
                        // "Mintemp:${weathermodel.mintemp.round()}",
                        // style: const TextStyle(fontSize: 16),
                        ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathermodel!.statues,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
