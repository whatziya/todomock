import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorUtils {
  static final Random _random = Random();

  static Color randomBrightColor() {
    while (true) {
      final color = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );

      if (color.computeLuminance() > 0.2  && color.computeLuminance() < 0.8) {
        return color;
      }
    }
  }
}
