import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../../../models/weather_model.dart';
import '../../home/widgets/extra_weather.dart';

class TomorrowWeather extends StatelessWidget {
  final Weather tomorrowTemp;
  const TomorrowWeather(this.tomorrowTemp);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlowContainer(
        color: const Color(0xff00A1FF),
        glowColor: const Color(0xff00A1FF),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, right: 30, left: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Row(
                    children: const [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      Text(
                        " 7 days",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(tomorrowTemp.image.toString()))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Tomorrow",
                        style: TextStyle(fontSize: 25, height: 0.1),
                      ),
                      Container(
                        height: 105,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GlowText(
                              tomorrowTemp.max.toString(),
                              style: const TextStyle(
                                  fontSize: 100, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "/${tomorrowTemp.min}\u00B0",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        " ${tomorrowTemp.name}",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                right: 50,
                left: 50,
              ),
              child: Column(
                children: [
                  const Divider(color: Colors.white),
                  const SizedBox(
                    height: 10,
                  ),
                  ExtraWeather(tomorrowTemp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
