import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weatherAppCubit/weatherCubit/weather_cubit.dart';

class SearchViewCubit extends StatelessWidget {
  const SearchViewCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: value!);
                  BlocProvider.of<WeatherCubit>(context)
                  .cityName=value;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter City Name',
                labelText: 'Search',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}

//WeatherModel? weatherModel;
//global var for access 2 scopes
