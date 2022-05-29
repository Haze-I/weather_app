import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import '../home_screen.dart';
import 'extra_weather.dart';

class CurrentWeather extends StatelessWidget {
  final Function() updateData;
  const CurrentWeather(this.updateData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GlowContainer(
        margin: const EdgeInsets.all(2),
        padding:
            const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
        glowColor: const Color(0xff00A1FF).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: const Color(0xff00A1FF),
        spreadRadius: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: Colors.white,
                ),
                Row(
                  children: const [
                    Icon(CupertinoIcons.placemark, color: Colors.white),
                    Text(
                      "Addis Ababa",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                const Icon(Icons.more_vert, color: Colors.white)
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                "Updated",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 390,
              child: Column(
                children: [
                  Image(
                    image: AssetImage(currentTemp!.image.toString()),
                    fit: BoxFit.fitHeight,
                    height: 300,
                  ),
                  GlowText(
                    currentTemp!.current.toString(),
                    style: const TextStyle(
                        height: 0.1,
                        fontSize: 150,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(currentTemp!.name.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(currentTemp!.day.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      )),
                  const Divider(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ExtraWeather(currentTemp!)
          ],
        ),
      ),
    );
  }
}
