import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'review', arguments: {'action': 'edit'});
        },
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.edit,
                size: 12,
                color: getColor('purple'),
              )),
          Text('Edit',
              style: TextStyle(
                  color: getColor('purple'),
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ]));
  }
}
