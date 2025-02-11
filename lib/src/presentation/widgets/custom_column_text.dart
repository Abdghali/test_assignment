import 'package:flutter/material.dart';

class CustumTextWithCpation extends StatelessWidget {
  final String? text;
  final String? caption;
  CustumTextWithCpation({Key? key, this.text, this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption!,
          style: Theme.of(context).textTheme.caption,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          text!,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
