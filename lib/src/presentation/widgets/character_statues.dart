import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

enum LiveStatues { alive, dead, unknown }

class CharacterStatues extends StatelessWidget {
  final LiveStatues? liveStatues;
  CharacterStatues({Key? key, this.liveStatues}) : super(key: key);

String alive = "Alive";
String dead = "Dead";
String unknown = "Unknown";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle,
          size: 11,
          color: liveStatues == LiveStatues.alive
              ? aliveColor
              : liveStatues == LiveStatues.dead
                  ? deadColor
                  : unKnownColor,
        ),
        const SizedBox(width: 6),
        Text(liveStatues == LiveStatues.alive
            ? alive
            : liveStatues == LiveStatues.dead
                ? dead
                : unknown,style: Theme.of(context).textTheme.bodyText1,),
      ],
    );
  }
}
