import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 65, 150, 255),
    ),
  );
}

SvgTheme svgTheme() {
  return const SvgTheme(currentColor: Colors.white);
}
