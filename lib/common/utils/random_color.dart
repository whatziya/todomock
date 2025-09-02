import 'dart:math';
import 'package:flutter/material.dart';

abstract final class RandomColorUtils {
  static final Random _random = Random();

  static Color randomBrightColor() {
    while (true) {
      final color = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
      final luminance = color.computeLuminance();
      if (luminance > 0.2 && luminance < 0.8) {
        return color;
      }
    }
  }
}
