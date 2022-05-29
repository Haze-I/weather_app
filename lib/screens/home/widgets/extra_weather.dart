import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/weather_model.dart';

class ExtraWeather extends StatelessWidget {
  final Weather temp;
  const ExtraWeather(this.temp);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${temp.wind} Km/h",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Wind",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.drop,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${temp.humidity} %",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Humidity",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "${temp.chanceRain} %",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Chance of rain",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        )
      ],
    );
  }
}
