import 'package:caelum/screens/details/widgets/seven_days.dart';
import 'package:caelum/screens/details/widgets/tomorrow.dart';
import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import '../home/home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(Weather? tomorrowTemp, List<Weather>? sevenDay, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: Column(
        children: [TomorrowWeather(tomorrowTemp!), SevenDays(sevenDay!)],
      ),
    );
  }
}
