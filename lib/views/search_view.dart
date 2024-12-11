// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_cubit/getWeather_cubit.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search a City"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Center(
//           child: TextField(
//             onSubmitted: (value) async {
//               var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
//               getweathercubit.getWeather(cityName: value);
//               Navigator.pop(context);
//               // ignore: unused_local_variable
//               // WeatherModel weatherModel =
//               //     await WeatherService(Dio()).getCurrentWeather(city: value);
//               // ignore: use_build_context_synchronously
//               // Navigator.pop(context);
//               // log(weatherModel.cityName);
//             },
//             decoration: const InputDecoration(
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//                 suffixIcon: Icon(Icons.search),
//                 hintText: 'Enter City Name',
//                 labelText: 'Search',
//                 border: OutlineInputBorder()),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //WeatherModel? weatherModel;
// //global var for access 2 scopes
