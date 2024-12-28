import 'package:flutter/material.dart';

const String fontFamily = 'Josefin Sans';

const Color black = Colors.black;
const Color white = Colors.white;
const Color primaryColor = Color(0xFF7B1F44);

TextStyle titleStyle([Color? color]) {
  return baseTitleStyle.copyWith(color: color ?? Colors.black);
}

const List<FontVariation> fontVariations = [
  FontVariation('ital', 0),
  FontVariation('wght', 700),
  FontVariation('ital', 1),
  FontVariation('wght', 700)
];
const List<FontVariation> fontVariations500 = [
  FontVariation('ital', 0),
  FontVariation('wght', 500),
  FontVariation('ital', 1),
  FontVariation('wght', 500)
];

TextStyle baseTitleStyle =
    const TextStyle(fontSize: 14.0, fontVariations: fontVariations);
