// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/views/search_view.dart';
// import 'package:weather_app/widget/no_weather_body.dart';
// import 'package:weather_app/widget/weather_info.dart';

// import '../cubits/get_weather_cubit/getWeather_cubit.dart';
// import '../cubits/get_weather_cubit/get_weather_state.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Weather App"),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SearchView(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.search),
//             ),
//           ],
//         ),
//         body: BlocBuilder<GetWeatherCubit, WeatherState>(
//             builder: (context, state) {
//           if (state is NoWeatherState) {
//             return const NoWeatherBody();
//           } else if (state is WeatherLoadedState) {
//             return  WeatherInfoBody(
//               weathermodell:state.weatherModel,
//             );
//           }
//           return const Text('Oops there\'s error');
//         })
//         //weatherModel==null? const NoWeatherBody():const WeatherInfoBody(),
//         );
//   }
// }
