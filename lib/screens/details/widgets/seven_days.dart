import 'package:flutter/material.dart';
import '../../../models/weather_model.dart';

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;
  SevenDays(this.sevenDay, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: sevenDay.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 84,
                    child: Text(
                      sevenDay[index].day.toString(),
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white54),
                    )),
                SizedBox(
                  width: 105,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(sevenDay[index].image.toString()),
                        width: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        sevenDay[index].name.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 84,
                  child: Row(
                    children: [
                      Text(
                        "+${sevenDay[index].max}\u00B0",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "+${sevenDay[index].min}\u00B0",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
