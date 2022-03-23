import 'package:coolmovies/utils/helpers/shorten_string.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:flutter/material.dart';

class InfoBubble extends StatelessWidget {
  final String info;
  final bool showIcon;

  const InfoBubble({Key? key, required this.info, required this.showIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        margin: const EdgeInsets.only(bottom: 5, right: 5),
        decoration: BoxDecoration(
            color: showIcon ? getColor('bubble') : getColor('bubble-dark'),
            borderRadius: const BorderRadius.all(Radius.circular(13))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          showIcon
              ? const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.white,
                  ))
              : Container(),
          Text(shortenString(info, 35),
              style: const TextStyle(color: Colors.white))
        ]));
  }
}
