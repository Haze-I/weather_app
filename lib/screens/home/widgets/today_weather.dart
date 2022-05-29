import 'package:caelum/screens/home/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

import '../../details/detail_screen.dart';
import '../home_screen.dart';

class WeatherToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailScreen(tomorrowTemp, sevenDay);
                  }));
                },
                child: Row(
                  children: const [
                    Text(
                      "7 days ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 140,
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: ListView.builder(
              itemCount: todayWeather!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WeatherWidget(todayWeather![index]),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
