import 'package:flutter/material.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color getPrimaryColor() {
  return getColorFromHex("#767680");
}

Color getDarkBackground() {
  return getColorFromHex("#FFE9E9");
}
