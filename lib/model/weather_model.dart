class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double avgtemp;
  final double mintemp;
  final double maxtemp;
  final String statues;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.avgtemp,
      required this.mintemp,
      required this.maxtemp,
      required this.statues});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      avgtemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      statues: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
