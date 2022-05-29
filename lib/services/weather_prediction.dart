import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import 'package:intl/intl.dart';

Future<List> getWeather() async {
  const weatherUrl =
      'https://api.openweathermap.org/data/2.5/onecall?lat=8.9806&lon=38.7578&units=metric&appid=8bbd15d84d4d478d6723f8573b838072';
  final weatherUri = Uri.parse(weatherUrl);
  http.Response response = await http.get(weatherUri);
  DateTime date = DateTime.now();

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    //current Temp
    var current = result["current"];
    Weather currentTemp = Weather(
        current: current["temp"]?.round() ?? 0,
        name: current["weather"][0]["main"].toString(),
        day: DateFormat("EEEE dd MMMM").format(date),
        wind: current["wind_speed"]?.round() ?? 0,
        humidity: current["humidity"]?.round() ?? 0,
        chanceRain: current["uvi"]?.round() ?? 0,
        image: findIcon(current["weather"][0]["main"].toString(), true));

    //today weather
    List<Weather> todayWeather = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 24; i++) {
      var temp = result["hourly"];
      var hourly = Weather(
          current: temp[i]["temp"]?.round() ?? 0,
          image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
          time: "${Duration(hours: hour + i + 1).toString().split(":")[0]}:00");
      todayWeather.add(hourly);
    }

    //Tomorrow Weather
    var daily = result["daily"][0];
    Weather tomorrowTemp = Weather(
        max: daily["temp"]["max"]?.round() ?? 0,
        min: daily["temp"]["min"]?.round() ?? 0,
        image: findIcon(daily["weather"][0]["main"].toString(), true),
        name: daily["weather"][0]["main"].toString(),
        wind: daily["wind_speed"]?.round() ?? 0,
        humidity: daily["rain"]?.round() ?? 0,
        chanceRain: daily["uvi"]?.round() ?? 0);

    //Seven Day Weather
    List<Weather> sevenDay = [];
    for (var i = 0; i < 7; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = result["daily"][i];
      var hourly = Weather(
          max: temp["temp"]["max"]?.round() ?? 0,
          min: temp["temp"]["min"]?.round() ?? 0,
          image: findIcon(temp["weather"][0]["main"].toString(), false),
          name: temp["weather"][0]["main"].toString(),
          day: day);
      sevenDay.add(hourly);
    }
    return [currentTemp, todayWeather, tomorrowTemp, sevenDay];
  }
  return [null, null, null, null];
}

String findIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/images/sunny.png";
      case "Rain":
        return "assets/images/rainy.png";
      case "Drizzle":
        return "assets/images/rainy.png";
      case "Thunderstorm":
        return "assets/images/thunder.png";
      case "Snow":
        return "assets/images/snow.png";
      default:
        return "assets/images/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/images/sunny_2d.png";
      case "Rain":
        return "assets/images/rainy_2d.png";
      case "Drizzle":
        return "assets/images/rainy_2d.png";
      case "Thunderstorm":
        return "assets/images/thunder_2d.png";
      case "Snow":
        return "assets/images/snow_2d.png";
      default:
        return "assets/images/sunny_2d.png";
    }
  }
}
