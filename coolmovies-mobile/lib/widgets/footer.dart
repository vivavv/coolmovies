import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String username;

  const Footer({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        color: getColor('footer'),
        child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(username,
                  style: TextStyle(
                    color: getColor('text-dark'),
                  )),
              const Padding(padding: EdgeInsets.only(right: 5)),
              Icon(Icons.person, color: getColor('text-dark'), size: 20)
            ])));
  }
}
