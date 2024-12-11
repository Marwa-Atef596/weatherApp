// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/getWeather_cubit.dart';
// import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
// import 'package:weather_app/views/homepage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       //حطيتها هنا عشان دا المكان الرئيسى للمكانين اللى عاوزه اوفرلهم الكيوبت
//       create: (context) => GetWeatherCubit(),
//       child: Builder(
//         builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
//           builder: (context, state) {
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               theme: ThemeData(
//                 primarySwatch: getColor(
//                     BlocProvider.of<GetWeatherCubit>(context)
//                         .weatherModel
//                         ?.statues),
//               ),
//               home: const HomePage(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// MaterialColor getColor(String? condition) {
//   if (condition == null) {
//     return Colors.blue;
//   }
//   switch (condition) {
//     case "Sunny":
//     case "Clear":
//       return Colors.amber;
//     case "Partly cloudy":
//       return Colors.grey;
//     case "Cloudy":
//     case "Overcast":
//       return Colors.blueGrey;
//     case "Mist":
//     case "Fog":
//     case "Freezing fog":
//     case "Blowing snow":
//     case "Blizzard":
//     case "Ice pellets":
//       return Colors.grey;
//     case "Patchy rain possible":
//     case "Patchy light drizzle":
//     case "Light drizzle":
//     case "Patchy light rain":
//     case "Light rain":
//     case "Patchy sleet possible":
//     case "Light sleet":
//     case "Light showers of ice pellets":
//     case "Moderate or heavy showers of ice pellets":
//       return Colors.lightBlue;
//     case "Moderate rain at times":
//     case "Moderate rain":
//     case "Heavy rain at times":
//     case "Heavy rain":
//     case "Light snow showers":
//     case "Moderate or heavy snow showers":
//       return Colors.blue;
//     case "Patchy snow possible":
//     case "Light snow":
//     case "Patchy light snow":
//     case "Patchy freezing drizzle possible":
//     case "Freezing drizzle":
//     case "Heavy freezing drizzle":
//     case "Thundery outbreaks possible":
//     case "Patchy light rain with thunder":
//     case "Moderate or heavy rain with thunder":
//       return Colors.deepPurple;

//     case "Light rain shower":
//     case "Moderate or heavy rain shower":
//     case "Torrential rain shower":
//       return Colors.indigo;
//     case "Moderate or heavy sleet showers":
//     case "Light sleet showers":
//       return Colors.indigo;

//     case "Patchy light snow with thunder":
//     case "Moderate or heavy snow with thunder":
//       return Colors.deepPurple;
//     default:
//       return Colors.blue;
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/weatherAppCubit/home_cubit.dart';
import 'package:weather_app/weatherAppCubit/weatherCubit/weather_cubit.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => WeatherCubit(WeatherService(Dio())),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getColor(
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModel
                        ?.statues),
              ),
              home:  HomePageCubit(),
            );
         
    
    
  }
}

MaterialColor getColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.grey;
    case "Cloudy":
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
    case "Blowing snow":
    case "Blizzard":
    case "Ice pellets":
      return Colors.grey;
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Patchy sleet possible":
    case "Light sleet":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.blue;
    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;

    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.indigo;
    case "Moderate or heavy sleet showers":
    case "Light sleet showers":
      return Colors.indigo;

    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
