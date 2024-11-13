import 'package:flutter/material.dart';

extension ColorExt on Color {
  Gradient toSingleColorGradient() {
    return LinearGradient(
      colors: [this, this],
      stops: const [1, 1],
    );
  }
}
