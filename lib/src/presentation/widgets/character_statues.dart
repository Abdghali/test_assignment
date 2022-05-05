import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/const.dart';

enum LiveStatues { alive, dead, unKnown }

class CharacterStatues extends StatelessWidget {
  final LiveStatues? liveStatues;
  CharacterStatues({Key? key, this.liveStatues}) : super(key: key);

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
        Text(
          liveStatues == LiveStatues.alive
              ? alive
              : liveStatues == LiveStatues.dead
                  ? dead
                  : unKnown,
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
