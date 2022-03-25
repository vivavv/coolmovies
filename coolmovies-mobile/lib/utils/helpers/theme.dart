import 'package:flutter/material.dart';

class AppColor {
  AppColor(
    this.name,
    this.color,
  );

  final String name;
  final Color color;
}

List<AppColor> appColors = <AppColor>[
  AppColor('background', const Color(0xFF242231)),
  AppColor('header', const Color(0xFF191722)),
  AppColor('text', const Color(0xFFc8cbd0)),
  AppColor('text-dark', const Color(0xFF949bb1)),
  AppColor('bubble', const Color(0xFF3a364f)),
  AppColor('bubble-dark', const Color(0xFF0e0d13)),
  AppColor('item', const Color(0xFF45415e)),
  AppColor('footer', const Color(0xFF2f2c40)),
  AppColor('purple', const Color(0xFFBEA9DF)),
];

Color getColor(String name) {
  int i = appColors.indexWhere((item) => item.name == name);

  return appColors[i].color;
}
